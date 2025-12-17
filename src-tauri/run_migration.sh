#!/usr/bin/env bash
# Script to create a new migration file

if [ -z "$1" ]; then
    echo "Usage: ./run_migration.sh <migration_name>"
    echo "Example: ./run_migration.sh create_users_table"
    exit 1
fi

MIGRATION_NAME=$1
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="m${TIMESTAMP}_${MIGRATION_NAME}.rs"
FILEPATH="src/database/migrations/${FILENAME}"

cat > "$FILEPATH" << 'EOF'
//! Migration: MIGRATION_DESCRIPTION

use sea_orm_migration::prelude::*;

#[derive(DeriveMigrationName)]
pub struct Migration;

#[async_trait::async_trait]
impl MigrationTrait for Migration {
    async fn up(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        // Create table example
        manager
            .create_table(
                Table::create()
                    .table(TableName::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(TableName::Id)
                            .integer()
                            .not_null()
                            .auto_increment()
                            .primary_key(),
                    )
                    // Add more columns here
                    .to_owned(),
            )
            .await?;

        Ok(())
    }

    async fn down(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        // Drop table
        manager
            .drop_table(Table::drop().table(TableName::Table).to_owned())
            .await?;

        Ok(())
    }
}

#[derive(DeriveIden)]
enum TableName {
    Table,
    Id,
    // Add more column identifiers here
}
EOF

# Replace MIGRATION_DESCRIPTION with actual name
sed -i "s/MIGRATION_DESCRIPTION/${MIGRATION_NAME}/g" "$FILEPATH"

echo "Created migration file: $FILEPATH"
echo ""
echo "Next steps:"
echo "1. Edit $FILEPATH to define your migration"
echo "2. Add the migration to src/database/migrations/mod.rs:"
echo "   - Add: mod ${FILENAME%.rs};"
echo "   - Add to migrations() vector: Box::new(${FILENAME%.rs}::Migration),"
