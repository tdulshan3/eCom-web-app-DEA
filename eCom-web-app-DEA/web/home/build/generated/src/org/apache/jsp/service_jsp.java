package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class service_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  <link rel=\"stylesheet\" href=\"service.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h1><b class=\"white-text\">SERVICES</b></h1>\n");
      out.write("    <div class=\"topic-container\">\n");
      out.write("        <img src=\"images\\warranty.png\" width=\"35\" height=\"37\"> <span>Warranty</span>\n");
      out.write("    </div>\n");
      out.write("    <p class=\"topic-text\">If your product is defective, we have a warranty and a reliable complaints procedure to ensure that your needs are addressed as quickly as possible. Most of our providers are local, so we can make sure that we can provide the best service according to the conditions below.</p>\n");
      out.write("    <h2><span class=\"list-text\">Conditions</span></h2>\n");
      out.write("    <ul>\n");
      out.write("        <li>Warranties are only valid to the extent of the warranty and the supplier's terms and conditions.</li>\n");
      out.write("        <li>The warranty is only valid for the period stated on each line item on your invoice.</li>\n");
      out.write("        <li>The packaging with the serial number must be intact when making a complaint.</li>\n");
      out.write("        <li>The warranty covers manufacturing defects only.</li>\n");
      out.write("        <li>The warranty does not cover physical damage.</li>\n");
      out.write("        <li>The warranty is only valid to the extent of the proof of purchase provided. If this evidence is not there, no warranty can be claimed.\n");
      out.write("        </li>\n");
      out.write("        <li>The supplier reserves the right to exchange / return / repair or exchange with another model.</li>\n");
      out.write("    </ul>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"topic-container\">\n");
      out.write("        <img src=\"images\\customorder.png\" width=\"35\" height=\"37\"> <span>Custom Orders</span>\n");
      out.write("    </div>\n");
      out.write("    <p class=\"topic-text\">If your needs exceed what the local market offers, we provide support to meet those needs. We will continue to discover and meet these demands across the horizon. The following conditions apply.</p>\n");
      out.write("    <h2><span class=\"list-text\">Conditions</span></h2>\n");
      out.write("    <ul>\n");
      out.write("        <li>To complete an individual order, a prepayment of 50% is required.</li>\n");
      out.write("        <li>Payments made for personal orders are non-refundable.</li>\n");
      out.write("    </ul>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("    <div class=\"topic-container\">\n");
      out.write("        <img src=\"images\\homedeliver.png\" width=\"35\" height=\"37\"> <span>Home Delivery</span>\n");
      out.write("    </div>\n");
      out.write("    <p class=\"topic-text\">For easy access to your needs, we offer tailored delivery directly to your home within Sri Lankan borders. So far, we are also in touch with our valued customers in Jaffna. We guarantee that we are ready to deliver to any part of Sri Lanka subject to the following conditions.</p>\n");
      out.write("    <h2><span class=\"list-text\">Conditions</span></h2>\n");
      out.write("    <ul>\n");
      out.write("        <li>100% full payment is required.</li>\n");
      out.write("        <li>Payment will be made directly to our bank account. Details available upon request.</li>\n");
      out.write("        <li>Delivery is entrusted to specialized delivery companies.</li>\n");
      out.write("    </ul>\n");
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
