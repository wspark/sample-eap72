<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    //request.setCharacterEncoding("UTF-8"); 
    Parameter myparam: <%= request.getParameter("myparam") %>
<%
        

    //request.setCharacterEncoding("UTF-8"); 

    String first = null ;
    String word = null;
	String OpertaionType = request.getParameter("OpertaionType");
    
    if ( request.getParameter("data") != null )
    {
    first = request.getParameter("data");
    word = first;
     
    System.out.println("=============================================================================");
    System.out.println("utf-8 -> utf-8        : " + new String(word.getBytes("utf-8"), "utf-8"));
    System.out.println("utf-8 -> euc-kr        : " + new String(word.getBytes("utf-8"), "euc-kr"));
    System.out.println("utf-8 -> ksc5601       : " + new String(word.getBytes("utf-8"), "ksc5601"));
    System.out.println("utf-8 -> x-windows-949 : " + new String(word.getBytes("utf-8"), "x-windows-949"));
    System.out.println("utf-8 -> iso-8859-1    : " + new String(word.getBytes("utf-8"), "iso-8859-1"));
    System.out.println("=============================================================================");
    System.out.println("iso-8859-1 -> euc-kr        : " + new String(word.getBytes("iso-8859-1"), "euc-kr"));
    System.out.println("iso-8859-1 -> euc-kr        : " + new String(word.getBytes("iso-8859-1"), "euc-kr"));
    System.out.println("iso-8859-1 -> ksc5601       : " + new String(word.getBytes("iso-8859-1"), "ksc5601"));
    System.out.println("iso-8859-1 -> x-windows-949 : " + new String(word.getBytes("iso-8859-1"), "x-windows-949"));
    System.out.println("iso-8859-1 -> utf-8         : " + new String(word.getBytes("iso-8859-1"), "utf-8"));
    System.out.println("=============================================================================");
    System.out.println("euc-kr -> euc-kr         : " + new String(word.getBytes("euc-kr"), "euc-kr"));
    System.out.println("euc-kr -> utf-8         : " + new String(word.getBytes("euc-kr"), "utf-8"));
    System.out.println("euc-kr -> ksc5601       : " + new String(word.getBytes("euc-kr"), "ksc5601"));
    System.out.println("euc-kr -> x-windows-949 : " + new String(word.getBytes("euc-kr"), "x-windows-949"));
    System.out.println("euc-kr -> iso-8859-1    : " + new String(word.getBytes("euc-kr"), "iso-8859-1"));
    System.out.println("=============================================================================");
    System.out.println("ksc5601 -> ksc5601        : " + new String(word.getBytes("ksc5601"), "ksc5601"));
    System.out.println("ksc5601 -> euc-kr        : " + new String(word.getBytes("ksc5601"), "euc-kr"));
    System.out.println("ksc5601 -> utf-8         : " + new String(word.getBytes("ksc5601"), "utf-8"));
    System.out.println("ksc5601 -> x-windows-949 : " + new String(word.getBytes("ksc5601"), "x-windows-949"));
    System.out.println("ksc5601 -> iso-8859-1    : " + new String(word.getBytes("ksc5601"), "iso-8859-1"));
    System.out.println("=============================================================================");
    System.out.println("x-windows-949 -> x-windows-949     : " + new String(word.getBytes("x-windows-949"), "x-windows-949"));
    System.out.println("x-windows-949 -> euc-kr            : " + new String(word.getBytes("x-windows-949"), "euc-kr"));
    System.out.println("x-windows-949 -> utf-8             : " + new String(word.getBytes("x-windows-949"), "utf-8"));
    System.out.println("x-windows-949 -> ksc5601           : " + new String(word.getBytes("x-windows-949"), "ksc5601"));
    System.out.println("x-windows-949 -> iso-8859-1        : " + new String(word.getBytes("x-windows-949"), "iso-8859-1"));
    System.out.println("=============================================================================");
     
    //first = new String(first.getBytes("iso-8859-1"), "utf-8");
    //System.out.println("data:" + first); 
    first = new String(first.getBytes("utf-8"), "utf-8");
    System.out.println("data:" + first); 
    } else first = "NULL";
    
%>
          
          <h2>ENCODING TEST [POST]</h2>
          <br>
          <form name="encoding" action="encodingTEST.jsp" method="post">
          <input type="hidden" name="OpertaionType" value="post">
              <table>
				  <tr>
				    <td>구분</td><td>입력값</td>
				  </tr>
				  <tr>
				      <td>DATA 입력</td>
				      <td><input name="data"></td>
				  </tr>
				  <tr>
				      <td colspan=2><input type="submit" value="OK"></td>     
				  </tr>
				</table>
			</form>
			
		<h2>ENCODING TEST [GET]</h2>
          <br>
          <form name="encoding" action="encodingTEST.jsp" method="get">
          <input type="hidden" name="OpertaionType" value="get">
              <table>
				  <tr>
				    <td>구분</td><td>입력값</td>
				  </tr>
				  <tr>
				      <td>DATA 입력</td>
				      <td><input name="data"></td>
				  </tr>
				  <tr>
				      <td colspan=2><input type="submit" value="OK"></td>     
				  </tr>
				</table>
			</form>          
			<br>
			
			<%

			System.out.println(" ================================== OpertaionType : " + OpertaionType);
			
	
			    if ( !first.equals("NULL"))
			    {
			      if ( OpertaionType.equals("get"))
			     
		             { 
		            	out.println("<h3>" + "Encoding GET Reault" + "</h3>");
		             } else 
		             {
		            	 out.println("<h3>" + "Encoding POST Reault" + "</h3>");            
		               }
			      
		             	
			  	 out.println("<h4>입력값 : " + first + "</h4>");
			     out.println("<br>");
			%>

            <table>
              <thead>
                <tr>
                  <th>#</th>
                  <th>구분</th>
                  <th>결과값</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>utf-8 -> utf-8</td>
                  <td> 
                  		<% out.println(new String(word.getBytes("utf-8"), "utf-8")); %>
                  </td>
                </tr>
                <tr>
                	 <td>2</td>
		    	     <td>utf-8 -> euc-kr</td>
		    	     <td>
		    	      		<% out.println(new String(word.getBytes("utf-8"), "euc-kr")); %>
		    	     </td>
		    	  </tr>
		    	  <tr>
		    	  	  <td>3</td>
		    	      <td>utf-8 -> ksc5601</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("utf-8"), "ksc5601")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	  	  <td>4</td>
		    	      <td>utf-8 -> x-windows-949</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("utf-8"), "x-windows-949")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>5</td>
		    	      <td>utf-8 -> iso-8859-1</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("utf-8"), "iso-8859-1")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>6</td>
		    	      <td>iso-8859-1 -> iso-8859-1</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("iso-8859-1"), "iso-8859-1")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>7</td>
		    	      <td>iso-8859-1 -> euc-kr</td>
		    	      <td>
		    	     		<% out.println(new String(word.getBytes("iso-8859-1"), "euc-kr")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>8</td>
		    	      <td>iso-8859-1 -> ksc5601</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("iso-8859-1"), "ksc5601")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>9</td>
		    	      <td>iso-8859-1 -> x-windows-949</td>
		    	      <td>
		    	     		<% out.println(new String(word.getBytes("iso-8859-1"), "x-windows-949")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>10</td>
		    	      <td>iso-8859-1 -> utf-8</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("iso-8859-1"), "utf-8")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>11</td>
		    	      <td>euc-kr -> euc-kr</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("euc-kr"),"euc-kr")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>12</td>
		    	      <td>euc-kr -> utf-8</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("euc-kr"),"utf-8")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>13</td>
		    	      <td>euc-kr -> ksc5601</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("euc-kr"), "ksc5601")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>14</td>
		    	      <td>euc-kr -> x-windows-949</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("euc-kr"), "x-windows-949")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	       <td>15</td>
		    	      <td>euc-kr -> iso-8859-1</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("euc-kr"), "iso-8859-1")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	       <td>16</td>
		    	      <td>ksc5601 -> ksc5601</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("ksc5601"), "ksc5601")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>17</td>
		    	      <td>ksc5601 -> euc-kr</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("ksc5601"), "euc-kr")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>18</td>
		    	      <td>ksc5601 -> utf-8</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("ksc5601"), "utf-8")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>19</td>
		    	      <td>ksc5601 -> x-windows-949</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("ksc5601"), "x-windows-949")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>20</td>
		    	      <td>ksc5601 -> iso-8859-1</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("ksc5601"), "iso-8859-1")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>21</td>
		    	      <td>x-windows-949 -> x-windows-949</td>
		    	      <td>
		    	     		<% out.println(new String(word.getBytes("x-windows-949"), "x-windows-949")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>22</td>
		    	      <td>x-windows-949 -> utf-8</td>
		    	      <td>
		    	     	 	<% out.println(new String(word.getBytes("x-windows-949"), "utf-8")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>23</td>
		    	      <td>x-windows-949 -> euc-kr</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("x-windows-949"), "euc-kr")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>24</td>
		    	      <td>x-windows-949 -> ksc5601</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("x-windows-949"),"ksc5601")); %>
		    	      </td>
		    	  </tr>
		    	  <tr>
		    	      <td>25</td>
		    	      <td>x-windows-949 -> iso-8859-1</td>
		    	      <td>
		    	      		<% out.println(new String(word.getBytes("x-windows-949"), "iso-8859-1")); %>
		    	      </td>
		    	  </tr>
              </tbody>
            </table>
<%

			    }
%>
