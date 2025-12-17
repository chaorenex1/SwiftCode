# PowerShell script to create a new migration file

param(
    [Parameter(Mandatory=$true)]
    [string]$MigrationName
)

$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$Filename = "m${Timestamp}_${MigrationName}.rs"
$Filepath = "src\database\migrations\$Filename"

$Content = @"
//! Migration: $MigrationName

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
"@

Set-Content -Path $Filepath -Value $Content

Write-Host "Created migration file: $Filepath" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Edit $Filepath to define your migration"
Write-Host "2. Add the migration to src\database\migrations\mod.rs:"
Write-Host "   - Add: mod $($Filename -replace '\.rs$','');"
Write-Host "   - Add to migrations() vector: Box::new($($Filename -replace '\.rs$','')::Migration),"
