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
<style>
    .uploadResult {
        width: 100%;
        background-color: gray;
    }

    .uploadResult ul {
        display: flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
    }

    .uploadResult ul li {
        list-style: none;
        padding: 10px;
    }

    .uploadResult ul li img {
        width: 20px;
    }
</style>

<h1>Upload with Ajax</h1>

<div class="uploadDiv">
    <input type="file" name="uploadFile" multiple>
</div>
<div class="uploadResult">
    <ul>

    </ul>
</div>

<button id="uploadBtn">Upload</button>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {

        var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        var maxSize = 5242880; // 5MB

        function checkExtension(fileName, fileSize) {
            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }
            if (regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }

        var cloneObj = $(".uploadDiv").clone();

        $("#uploadBtn").on("click", function (e) {
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;

            console.log(files);

            // add filedate to formData
            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            var uploadResult = $(".uploadResult ul");

            function showUploadedFile(uploadResultArr) {

                var str = "";

                $(uploadResultArr).each(function (i, obj) {

                    if (!obj.image) {
                        str += "<li><img src='https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Mail-attachment.svg/1024px-Mail-attachment.svg.png'>" + obj.fileName + "</li>";
                    } else {
                        //str += "<li>" + obj.fileName + "</li>";
                        var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                        str += "<li><img src='/display?fileName=" + fileCallPath + "'><li>";
                    }
                });
                uploadResult.append(str);
            }

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    showUploadedFile(result);
                    $(".uploadDiv").html(cloneObj.html());
                }
            });
        });
    });
</script>

</body>
</html>
