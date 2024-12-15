CREATE TABLE IF NOT EXISTS rental_agreements (
    id SERIAL PRIMARY KEY,
    property_id INT,
    tenant_name VARCHAR(255),
    tenant_type INTEGER,  
    rent_amount NUMERIC
);


INSERT INTO rental_agreements (property_id, tenant_name, tenant_type, rent_amount)
SELECT
    property_id,
    tenant_name,
    t.tenant_type_id,
    rent_amount
FROM (VALUES
    (1, 'Иванов И.И.', 'Физическое лицо', 15000),
    (2, 'ООО "Арендатор"', 'Юридическое лицо', 30000),
    (3, 'ИП Петров', 'Индивидуальный предприниматель', 20000)
) AS new_data(property_id, tenant_name, tenant_type_name, rent_amount)
JOIN tenant_type_lookup t
    ON new_data.tenant_type_name = t.tenant_type_name;  


CREATE TABLE IF NOT EXISTS rental_agreements_backup AS SELECT * FROM rental_agreements;


CREATE TABLE IF NOT EXISTS tenant_type_lookup (
    tenant_type_id SERIAL PRIMARY KEY,
    tenant_type_name VARCHAR(100) UNIQUE
);


INSERT INTO tenant_type_lookup (tenant_type_name)
SELECT * FROM (VALUES
    ('Физическое лицо'),
    ('Юридическое лицо'),
    ('Индивидуальный предприниматель')
) AS new_types(tenant_type_name)
WHERE NOT EXISTS (
    SELECT 1 FROM tenant_type_lookup WHERE tenant_type_name = new_types.tenant_type_name
);


DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'rental_agreements' AND column_name = 'tenant_type_id') THEN
        ALTER TABLE rental_agreements ADD COLUMN tenant_type_id INT;
    END IF;
END $$;


DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'rental_agreements' AND column_name = 'tenant_type_name') THEN
        ALTER TABLE rental_agreements DROP COLUMN tenant_type_name;
    END IF;
END $$;


DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'rental_agreements' AND column_name = 'tenant_type') THEN
        UPDATE rental_agreements
        SET tenant_type = t.tenant_type_id
        FROM tenant_type_lookup t
        WHERE rental_agreements.tenant_type = t.tenant_type_id;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'rental_agreements' AND column_name = 'tenant_type') THEN
        ALTER TABLE rental_agreements RENAME COLUMN tenant_type_id TO tenant_type;
    END IF;
END $$;

SELECT
    ra.id,
    ra.property_id,
    ra.tenant_name,
    t.tenant_type_name AS tenant_type,
    ra.rent_amount
FROM rental_agreements ra
JOIN tenant_type_lookup t
    ON ra.tenant_type = t.tenant_type_id;
