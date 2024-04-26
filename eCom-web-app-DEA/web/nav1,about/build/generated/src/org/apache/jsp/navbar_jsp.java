package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class navbar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Tec</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"navbar.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    <script src=\"include.js\" defer></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <nav>\n");
      out.write("        <div class=\"topnav\" id=\"myTopnav\">\n");
      out.write("            <a href=\"index.html\"><img class=\"logo\" src=\".images/logo.jpeg\" alt=\"Logo\"></a>\n");
      out.write("            <a href=\"#about\"><b>About</b></a>\n");
      out.write("            <a href=\"#services\"><b>Services</b></a>\n");
      out.write("            <a href=\"#contact\"><b>Contact</b></a>\n");
      out.write("            <a href=\"#categouirs\"><b>Categouirs <i class=\"fa fa-caret-down\"></i></b></a>\n");
      out.write("            <div class=\"dropdown-content\">\n");
      out.write("               \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("         \n");
      out.write("            <div class=\"contact-info\"><i class=\"bi bi-phone\"></i>Contact: +1234567890</div>\n");
      out.write("            <div class=\"search-container\">\n");
      out.write("                <form action=\"/search\" method=\"GET\">\n");
      out.write("                    <div class=\"contact-info\"><i class=\"bi bi-search \"></i><input type=\"text\" placeholder=\"Search...\" name=\"search\">\n");
      out.write("                    <button type=\"submit\"></button>\n");
      out.write("\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("           <div class=\"menu\">\n");
      out.write("            <a href=\"javascript:void(0);\" class=\"icon\" onclick=\"myFunction()\">\n");
      out.write("                <i class=\"fa fa-bars\"></i>\n");
      out.write("            </a>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"cart\">\n");
      out.write("        <div class=\"signup\">\n");
      out.write("            <a href=\"#signup\">   signup   </a>\n");
      out.write("            <div class=\"contact-info2\"><i class=\"bi bi-cart-dash-fill\"></i>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </div></div>\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        function myFunction() {\n");
      out.write("            var x = document.getElementById(\"myTopnav\");\n");
      out.write("            if (x.className === \"topnav\") {\n");
      out.write("                x.className += \" responsive\";\n");
      out.write("            } else {\n");
      out.write("                x.className = \"topnav\";\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
