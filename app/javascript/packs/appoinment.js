// document.addEventListener("turbolinks:load", function() {

//     var veh_dd = document.getElementById("appoinment_booking_vehicle_name");
//     $("input[type=radio]").on("change", function() {

//         while (veh_dd.firstChild) veh_dd.removeChild(veh_dd.firstChild);

//         if ($('#appoinment_booking_vehicle_type_two-wheeler').is(':checked')) {
//             $.ajax({
//                 url: "/appoinment_bookings?vehicle=two",
//                 type: "GET"
//             })

//         }
//         if ($('#appoinment_booking_vehicle_type_four-wheeler').is(':checked')) {
//             $.ajax({
//                 url: "/appoinment_bookings?vehicle=four",
//                 type: "GET"
//             })

//         }
//         // // var placeholder = document.createElement("option");
//         // // placeholder.text = "Select city";
//         // // placeholder.value = "";
//         // // city.appendChild(placeholder);
//         // $.ajax({
//         // url: "/appoinment_booking/new?two_wheeler=" + two_wheeler.value,
//         // type: "GET"
//         // })
//     });


//     $("#booked_appointment_service_center_id").on("change", function() {
//         var center_name = $("#booked_appointment_service_center_id").val()
//         alert(center_name);

//         // while (veh_dd.firstChild) veh_dd.removeChild(veh_dd.firstChild);

//         if ($('#appoinment_booking_vehicle_type_two-wheeler').is(':checked')) {
//             $.ajax({
//                 url: "/appoinment_bookings?center_id=" + center_name,
//                 type: "GET"
//             })

//         }
//     });



// })