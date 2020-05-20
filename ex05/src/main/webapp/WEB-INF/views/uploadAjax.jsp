<%--
  Created by IntelliJ IDEA.
  User: susan
  Date: 2020-05-20
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
    <input type="file" name="uploadFile" multiple>
</div>

<button id="uploadBtn">Upload</button>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $("#uploadBtn").on("click", function (e) {
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;

            console.log(files);

            // add filedate to formData
            for (var i = 0; i < files.length; i++) {
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function (result) {
                    alert("Uploaded")
                }
            });
        });
    });
</script>

</body>
</html>
