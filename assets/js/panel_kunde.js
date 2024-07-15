const DeleteStatementBtn = document.querySelector(".add_statement_btn[name=Delete]");
const AddStatementBtn = document.querySelector(".add_statement_btn[name=Add]");
const UpdateStatementBtn = document.querySelector(".add_statement_btn[name=Update]");
const SelectStatementBtn = document.querySelector(".add_statement_btn[name=Select]");
const ChooseNotUsedStatementBtn = document.querySelector(".add_statement_btn[name=ChooseNotUsed]");
const ChooseNeverSold = document.querySelector(".add_statement_btn[name=ChooseNeverSold]");

const controlBtns = document.querySelectorAll(".add_statement_btn");
const sqlStatementsTextarea = document.querySelector(".sql_statements");

controlBtns.forEach((btn) => {
    btn.addEventListener("click", (e) => {
        if (e.target.name == "Delete") {
            sqlStatementsTextarea.value =
                `-- Enter Zutat ID 
SET @v_Kunde_Nr = ???;

DELETE FROM Kunde WHERE Kunde_Nr = @v_Kunde_Nr;
DELETE FROM Kunde_Adr WHERE Kunde_Nr = @v_Kunde_Nr;
DELETE FROM Bestellung WHERE Kunde_Nr = @v_Kunde_Nr;
DELETE FROM Kunde_Login WHERE Kunde_Nr = @v_Kunde_Nr;
DELETE FROM Adresse Where Kunde.Kunde_Nr = @v_Kunde_Nr AND Adresse.Adr_ID NOT IN (Select Knd_Adr.Adr_ID from Knd_Adr);`;

        } else if (e.target.name == "Add") {
            sqlStatementsTextarea.value = `INSERT INTO Kunde (Feld_Namen,??,??) VALUES (?, ?)`
        } else if (e.target.name == "Update") {
            sqlStatementsTextarea.value = `UPDATE Kunde SET Kunde.Feld_Name = ??? WHERE Kunde.Feld_Name = ???`
        } else if (e.target.name == "Select") {
            sqlStatementsTextarea.value = `SELECT * FROM Kunde`;
        } else if (e.target.name == "ChooseNotUsed") {
            sqlStatementsTextarea.value = ``
        } else if (e.target.name == "ChooseNeverSold") {
            sqlStatementsTextarea.value = ``
        }
    });
})



//Params Function
loadSqlStatement();
function loadSqlStatement(){
    const params = new URLSearchParams(window.location.search);
    params.forEach((value,key) => {
        sqlStatementsTextarea.value = value;
});
}