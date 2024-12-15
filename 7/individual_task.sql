-- Таблица текущих договоров
CREATE TABLE contracts (
    contract_id SERIAL PRIMARY KEY,
    tenant_inn VARCHAR(12) NOT NULL,
    tenant_name VARCHAR(100) NOT NULL,
    cadastral_number VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Таблица архивных договоров
CREATE TABLE contract_archive (
    contract_id SERIAL PRIMARY KEY,
    tenant_inn VARCHAR(12) NOT NULL,
    tenant_name VARCHAR(100) NOT NULL,
    cadastral_number VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    termination_date DATE NOT NULL
);



-- Вставка данных
INSERT INTO contracts (tenant_inn, tenant_name, cadastral_number, address, start_date, end_date)
VALUES
('123456789012', 'ООО Ромашка', '77:01:0004012:452', 'г. Москва, ул. Пушкина, д. 1', '2020-01-01', '2025-01-01'),
('987654321098', 'ООО Лилия', '50:10:1234567:890', 'г. Подольск, ул. Ленина, д. 15', '2019-06-15', '2024-06-15');


--  Процедура для расторжения договора
CREATE OR REPLACE PROCEDURE terminate_contract(p_contract_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Перемещаем данные договора в архивную таблицу
    INSERT INTO contract_archive (contract_id, tenant_inn, tenant_name, cadastral_number, address, start_date, end_date, termination_date)
    SELECT contract_id, tenant_inn, tenant_name, cadastral_number, address, start_date, end_date, CURRENT_DATE
    FROM contracts
    WHERE contract_id = p_contract_id;

    -- Удаляем договор из текущей таблицы
    DELETE FROM contracts
    WHERE contract_id = p_contract_id;
END;
$$;


-- Расторгаем договор с ID = 1
CALL terminate_contract(1);

-- Проверяем таблицы
SELECT * FROM contracts;
SELECT * FROM contract_archive;