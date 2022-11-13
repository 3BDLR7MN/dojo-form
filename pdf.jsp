<!-- this is to display arabic letters! -->
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- this stylesheet is for dojo dijit style (claro specifically) -->
    <link
      rel="stylesheet"
      href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.4/dijit/themes/claro/claro.css"
      media="screen"
    />

    <!-- CSS -->
    <style>
      html,
      body {
        width: 100%;
        height: 100%;
      }

      #BorderContainer {
        width: 90%;
        /* height: 100%; */
        margin: 0 auto;
        padding-top: 0;
      }

      #centerPane {
        padding: 0 10%;
        background-color: rgb(228, 223, 234);
      }

      #bottomPane {
        padding: 0 10%;
      }

      h2 {
        color: rgb(73, 73, 220);
      }

      form {
        display: flex;
        flex-direction: column;
        gap: 10px;
        align-items: center;
        background-color: white;
      }
      form > div {
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid black;
      }
      div > label {
        width: 25%;
      }
      label:last-child {
        text-align: right;
      }
      table {
        margin: 0 auto;
        width: 100%;
        text-align: center;
        border-collapse: collapse;
      }
      tr {
        border-bottom: 1px solid black;
      }
      button {
        margin-top: 20px;
      }

      .header {
        text-align: center;
      }

      .info {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .info > h2 {
        text-align: right;
      }
    </style>

    <title>Dojo Form Project</title>
  </head>

  <!-- in order for the dijit style to apply you have to link a class to the body -->
  <body class="claro">
    <!-- Container -->
    <div id="BorderContainer" data-dojo-type="dijit/layout/BorderContainer">
      <!-- center pane -->
      <div id="centerPane">
        <div class="header">
          <h2>
            الشركة الوطنية لخدمة البيانات والحلول المتكاملة <br />
            National DataServe & Turnkey Solution Co
          </h1>
          <hr />
        </div>

        <div class="info">
          <span>Barcode</span>
          <h2>
            رخصة إثبات الاستحقاق <br />
            Software license Proof of Entitlements
          </h2>
        </div>

        <!-- form -->
        <!-- form is not submittable, only remained to not alter the style -->
        <form id="form">
          <div>
            <label for="customerName">DataServe Customer name</label>
            <span><%=request.getParameter("customerName")%></span>
            <label for="customerName">اسم العميل لدى داتاسيرف</label>
          </div>

          <div>
            <label for="customerNumber">DataServe Customer Number</label>
            <span><%=request.getParameter("customerNumber")%></span>
            <label for="customerNumber">رقم العميل لدى داتاسيرف</label>
          </div>

          <div>
            <label for="siteNumber">DataServe Site Number</label>
            <span><%=request.getParameter("siteNumber")%></span>
            <label for="siteNumber">رقم موقع داتاسيرف</label>
          </div>

          <div>
            <label for="projectName">Project Name as per RFP</label>
            <span><%=request.getParameter("projectName")%></span>
            <label for="projectName">اسم المشرو ع</label>
          </div>

          <div>
            <label for="christeningNumber">Christening Number</label>
            <span><%=request.getParameter("christeningNumber")%></span>
            <label for="christeningNumber">رقم التعميد</label>
          </div>

          <div>
            <label for="christeningDate">Christening Date</label>
            <span><%=request.getParameter("christeningDate")%></span>
            <label for="christeningDate">تاريخ التعميد</label>
          </div>

          <div>
            <label for="poNumber">Customer P.O Reference Number</label>
            <span><%=request.getParameter("poNumber")%></span>
            <label for="poNumber">رقم العقد</label>
          </div>

          <div>
            <label for="poDate">P.O Date</label>
            <span><%=request.getParameter("poDate")%></span>
            <label for="poDate">تاريخ العقد</label>
          </div>

          <div>
            <label for="customerContact">Customer Contact</label>
            <span><%=request.getParameter("customerContact")%></span>
            <label for="customerContact">رقم التواصل بالعميل</label>
          </div>

          <div>
            <label for="address">Address</label>
            <span><%=request.getParameter("address")%></span>
            <label for="address">عنوان العميل</label>
          </div>
        </form>
      </div>

      <br />

      <div id="bottomPane">
        <div class="info">
          <h2>Licenses List</h2>
          <h2>قائمة الرخص</h2>
        </div>
        
        <table id="table">
          <tr style="background-color: rgb(73, 73, 220); color: white">
            <th>الكمية<br />Quantity</th>
            <th>النوع<br />Type</th>
            <th>الوصف<br />Description</th>
            <th>الرقم<br />Part Number</th>
          </tr>
          <!-- code to check how many rows (counter value) are passed and create table based on it -->
          <% int counter = Integer.parseInt(request.getParameter("counterInput"));
          for(int i = 1; i <= counter; i+=1) {
            %>
            <tr>
              <td><%=request.getParameter("quantity"+i)%></td>
              <td><%=request.getParameter("type"+i)%></td>
              <td><%=request.getParameter("description"+i)%></td>
              <td><%=request.getParameter("partNumber"+i)%></td>
            </tr>
            <%
          }
          %>
        </table>

        <button id="printbtn">Print</button>
      </div>
    </div>

    <!-- Dojo CDN Script -->
    <!-- http: IMPORTANT -->
    <script
      src="http://ajax.googleapis.com/ajax/libs/dojo/1.14.1/dojo/dojo.js"
      data-dojo-config="has:{'dojo-firebug': true}, parseOnLoad: true, foo: 'bar', async: 1"
    ></script>

    <!-- Dojo Script -->
    <script>
      require([
        "dojo/dom",
        "dojo/on",
        // ----------
        "dojo/parser",
        "dijit/layout/BorderContainer",
        "dijit/layout/ContentPane",
        "dojo/domReady!",
      ], function (dom, on) {
        var printbtn = dom.byId("printbtn");

        // func for when "print" button is clicked
        on(printbtn, "click", function (e) {
          window.print();
        });
      });
    </script>
  </body>
</html>
