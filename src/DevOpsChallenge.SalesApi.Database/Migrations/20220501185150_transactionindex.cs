using Microsoft.EntityFrameworkCore.Migrations;

namespace DevOpsChallenge.SalesApi.Database.Migrations
{
    public partial class transactionindex : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
			name: "Transaction_Index",
			table: "Sale",
			column: "TransactionId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
