$(function(){

    $('#employee_birth_date').datepicker({
        yearRange: '1960:2000',
        maxDate: "0"
    });

    $('#employee_join_date').datepicker({
        yearRange: '2005:c',
        maxDate: "0"
    });

    $('.change_image_btn').click(function(){
        $('input[id=employee_picture]').click();
    });

    $('#employee_picture').change(function(){
        readURL(this);
    });
});

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.employee_picture_img').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}