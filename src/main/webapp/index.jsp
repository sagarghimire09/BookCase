<%--
  Created by IntelliJ IDEA.
  User: Sagar
  Date: 09/20/19
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookCase - Home</title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <div>
        <h1>Add Book</h1>
        <form id="addForm" novalidate>
            <label>Title </label>
            <input type="text" name="title" id="title" required><br><br>
            <label>ISBN </label>
            <input type="text" name="isbn" id="isbn" required><br><br>
            <input type="submit" value="Submit" id="btnSubmit">
        </form>
    </div>
    <div>
        <h2>List Books</h2>
        <div id="bookDiv">
            <table id="bookTable">
                <tr>
                    <th>Title</th>
                    <th>ISBN</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>test</td>
                    <td>2343ads</td>
                </tr>
            </table>
        </div>
    </div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#btnSubmit').click(function () {
                $.ajax("addBook",{
                    type: "POST",
                    dataType: "json",
                    data: $('#addForm').serialize(),
                    complete: function () {
                        $('#addForm').trigger("reset");
                    },
                    success: function (book) {
                        $('#bookTable').append("<tr><td>"+book.title+"</td><td>"+book.isbn+"</td></tr>");
                        // $.each(books, function (k,v) {
                        //     console.log(v.isbn);
                        //     $('#bookTable').append("<tr><td>"+v.k+"</td><td>"+v.title+"</td><td>"+v.isbn+"</td></tr>");
                        // });
                    }
                });

                return false;
        });
    });
</script>
</body>
</html>
