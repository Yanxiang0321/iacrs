<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${system_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${base}/css/global.css" type="text/css" rel="Stylesheet" />
<script src="${thirdparty}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function callback(imagePath)
    {
        if (imagePath != undefined && imagePath != '')
        {
            alert('Upload Successful');
            var file = $('#upload_file');
            file.after(file.clone().val(""));
            file.remove();
            $('#imagePath').attr('value', imagePath);
            var img = $("#model_image");
            img.after(img.clone().attr('src', '${base}/' + imagePath));
            img.remove();
            $('#image_tr').show();
        } else
        {
            alert('Upload Failure');
        }
    }

    $(function()
    {
        $('#btn_upload').click(function()
        {
            var file = $('#upload_file');
            if (file.val() == '')
            {
                alert('Select Picture');
                return false;
            }

            $('#upload_form').empty();
            $('#upload_form').append(file);
            var clone = file.clone();
            clone.attr('value', '');
            $('#file_container').append(clone);
            file.attr('id', '');
            $('#upload_form').submit();
        });
    });
</script>
</head>
<body>
    <form action="${base}/admin/car/add_model" method="post">
        <table class="detail">
            <thead>
                <tr>
                    <td colspan="2">Add Model</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Name</th>
                    <td>
                        <input type="text" name="name" />
                    </td>
                </tr>
                <tr>
                    <th>Category</th>
                    <td>
                        <input type="text" name="category" />
                    </td>
                </tr>
                <tr>
                    <th>Brand</th>
                    <td>
                        <input type="text" name="brand" />
                    </td>
                </tr>
                <tr>
                    <th>Style</th>
                    <td>
                        <input type="text" name="style" />
                    </td>
                </tr>
                <tr>
                    <th>Coach Type</th>
                    <td>
                        <select name="coachType">
                            <option value="0">Two tanks</option>
                            <option value="1">Three tanks</option>
                            <option value="2">Others</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Gear Type</th>
                    <td>
                        <select name="gearType">
                            <option value="0">Manual</option>
                            <option value="1">Auto</option>
                            <option value="2">Others</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Swept Volume</th>
                    <td>
                        <input type="text" name="sweptVolume" />
                    </td>
                </tr>
                <tr>
                    <th>Upload Picture</th>
                    <td>
                        <input type="hidden" id="imagePath" name="imagePath" />
                        <div id="file_container">
                            <input type="file" id="upload_file" name="file" style="width: 600px;" />
                        </div>
                        <input type="button" id="btn_upload" value="Upload" />
                    </td>
                </tr>
                <tr id="image_tr" style="display: none;">
                    <th>Picture：</th>
                    <td>
                        <img src="" alt="" id="model_image" />
                    </td>
                </tr>
                <tr>
                    <th>Daily Rental($)</th>
                    <td>
                        <input type="text" name="dailyRental" />
                    </td>
                </tr>
                <tr>
                    <th>Daily Premium($)</th>
                    <td>
                        <input type="text" name="dailyPremium" />
                    </td>
                </tr>
                <tr>
                    <th>Preauth($)</th>
                    <td>
                        <input type="text" name="preauth" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="actions">
                        <input type="submit" value="Submit" />
                        <input type="button" value="Back" onclick="history.go(-1);"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    <form id="upload_form" style="display: none;" action="${base}/master/upload" method="post" enctype="multipart/form-data" target="uploadFrame"></form>
    <iframe style="display: none;" name="uploadFrame" id="uploadFrame"></iframe>
</body>
</html>