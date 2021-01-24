<?php
// require_once './public/dompdf/autoload.inc.php';
// // require_once "{{URL::to('public/js/app.js')}}";


// use Dompdf\Dompdf;

// //initialize dompdf class

// $document = new Dompdf();


$html = '
<table width="100%">
  <tr>
    <td><h1>Invoice</h1><td>
    <td style="width:80%"></td>
    <td>
      <img src="bdgov.png" alt="LOGO" height="80" width="80"/>
      <br/>
      <p>Akter Group
      <br/>
      Abu-Dhabi, UAE</p>
    </td>
  </tr>
</table>
<br/>
<hr/>
';
$html .='
<table width="100%">
  <tr>
  <td colspan="3">Invoice No: '.$invoice_no.'</td>
  <td>Date: '.$invoice_date.'</td>
  </tr>
  <tr>
    <td colspan="2">Name : '.$name.'</td>
    <td colspan="2">Status : ';
  if($status==1)
    $html.='PAID';
  else if($status==2)
    $html.='Credit';
  else
    $html.='Hold';

 $html.='</td>
  </tr>';
  if($name !== "Walk In Customer"){
    $html.='<tr>
      <td colspan="2">Phone no: '.$phn.'</td>
      <td colspan="2">Email: '.$mail_address.'</td>
    </tr>
    <tr>
      <td colspan="2">Address: '.$address.'</td>
      <td colspan="2">City: '.$city.'</td>
    </tr>';
  }
  $html.='
</table>
<hr/>
<center><h1>Details</h1></center>
<br/>
<table width="100%">
<thead>
<tr>
<th>Code</th>
<th width="100%">Name</th>
<th>Quantity</th>
<th>Price</th>
</tr>
</thead>
<tbody>
';
  foreach ($products as &$product) { 
    # code...
      $html.= '<tr>';
      $html.= '<td>'. $product['item']['code'] .' </td>';
      $html.= '<td width="100%"><center>'. $product['item']['name'] .'</center> </td>';
      $html.= '<td>'. $product['numberOfItems'] .' </td>';
      $html.= '<td>'. $product['item']['price'] .' </td>';
      $html.= '</tr>';
  }
 
$html.='</tbody>
<tfoot>
<tr>
  <th width="100%" colspan=3><center>Grand total</center></th>
  <th>'.$total.'</th>
<tr/>
</tfoot>
</table>
';

echo $html;
// $pdf = PDF::loadView($html);

// $pdf->loadHtml($html);
// $pdf->setPaper('A4', 'portrait');
// $pdf->render();
// $pdf->stream("COVID-19 report", array("Attachment"=>0));
// $pdf->stream();


?>
