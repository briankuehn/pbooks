<!--
Program: PBooks
Component: notes.xsl
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="main.xsl"/>
  <xsl:include href="pager.xsl"/>
  <xsl:template name="content">
    <xsl:call-template name="jquery-setup-simple">
      <xsl:with-param name="my-table">notes_table</xsl:with-param>
    </xsl:call-template>
    <table class="tablesorter" id="notes_table">
      <thead>
        <tr>
          <th>
            <xsl:value-of select="/_R_/i18n/note_id"/>
          </th>
          <th>
            <xsl:value-of select="/_R_/i18n/note_value"/>
          </th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="/_R_/fiscal_notes/note">
          <tr>
            <td>
              <xsl:value-of select="note_id"/>
            </td>
            <td>
              <xsl:value-of select="note_value"/>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
    <xsl:value-of select="/_R_/i18n/note_info"/>
  </xsl:template>
</xsl:stylesheet>