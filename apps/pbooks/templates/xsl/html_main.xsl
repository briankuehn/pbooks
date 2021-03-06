<!--
Program: PBooks
Component: main.xsl
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">
	<xsl:import href="http://github.com/docunext/1bb02b59/raw/master/output.xhtml11.xsl"/>
	<xsl:include href="html_custom.xsl"/>
	<xsl:include href="date_select_new.xsl"/>
	<xsl:template name="main">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="i18n"/>


		<!-- THE PURPOSE OF THIS TEMPLATE IS TO PROVIDE A LAYER OF ABSTRACTION. -->
    <xsl:call-template name="body">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="path_prefix" select="$path_prefix"/>
      <xsl:with-param name="i18n" select="$i18n"/>
    </xsl:call-template>

	</xsl:template>


</xsl:stylesheet>