package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class award_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"award.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"topic-container\">\n");
      out.write("        <img src=\"images\\award.png\" width=\"75\" height=\"70\"> <span>Winner of the Most Popular Award at BestWeb.lk</span>\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <div class=\"square-container\">\n");
      out.write("    <div class=\"container\">  <img src=\"images\\warranty.png\" width=\"70\" height=\"70\">\n");
      out.write("        <br>\n");
      out.write("        <span>WARRANTY ASSURED</span>\n");
      out.write("        <br>  \n");
      out.write("        <p>In the event of a product defect, we have established warranty and claims procedures to ensure that your needs are met as best as possible without wasting your time.</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"container\">  <img src=\"images\\customorder.png\" width=\"70\" height=\"70\">\n");
      out.write("        <br>\n");
      out.write("        <span>CUSTOM ORDERS</span>\n");
      out.write("        <br>  \n");
      out.write("        <p>If your needs take precedence over what the local market offers, we can help meet those needs.</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"container\">  <img src=\"images\\homedeliver.png\" width=\"70\" height=\"70\">\n");
      out.write("        <br>\n");
      out.write("        <span>HOME DELIVERY</span>\n");
      out.write("        <br>  \n");
      out.write("        <p>To make your needs even more accessible, we offer delivery services to meet your needs directly to your location within Sri Lankan borders.</p>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"condition\">\n");
      out.write("<span class=\"condition1\">*Conditions Applied </span>\n");
      out.write("<span class=\"condition2\">*Conditions Applied </span>\n");
      out.write("<span class=\"condition3\">*Conditions Applied </span>\n");
      out.write("</div>\n");
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
