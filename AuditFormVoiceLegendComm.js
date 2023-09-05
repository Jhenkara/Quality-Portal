
function DropDownFilter() {
            var get = document.getElementById("<%=dda1.ClientID%>");
            var getvalue=get.options[get.selectedIndex].value;
            //alert("The Value is" + getvalue);
            document.getElementById("TotalCompl").innerHTML = getvalue;
        }
   