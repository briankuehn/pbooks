<!--
Program: PBooks
Component: account_row.xsl
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
	<!-- This is the account table row -->
  <xsl:template name="account-row">
		<xsl:param name="link_prefix"/>


<!-- these rows contain ids for use in testing, do not remove! -->
<tr style="cursor: pointer;" id="a_{id}">

  <!-- Show account checkbox -->
  <xsl:if test="/_R_/_get/show_all_accounts='on'">
    <td>
      <input type="checkbox" name="hide[]" value="{id}">
        <xsl:if test="hide='on'">
          <xsl:attribute name="checked">checked</xsl:attribute>
        </xsl:if>
      </input>
    </td>
  </xsl:if>

  <!-- Account number -->
  <td onclick="location.href='{$link_prefix}ledger&amp;account_id={id}';">
    <xsl:value-of select="account_number"/>
  </td>

  <!-- Account name -->
  <td>
    <a href="{$link_prefix}ledger&amp;account_id={id}" title="account_id: {id}">
      <xsl:value-of select="name"/>
    </a>
  </td>

  <!-- Account type -->
  <xsl:if test="not(/_R_/_get/nid='customer-accounts')">
    <td onclick="location.href='{$link_prefix}ledger&amp;account_id={id}';">
      <a href="{$link_prefix}accounts&amp;account_type_id={account_type_id}">
        <xsl:value-of select="account_type_id"/>
      </a>
    </td>
  </xsl:if>

  <!-- Running balance -->
  <xsl:if test="account_type_id='20000' or account_type_id='30000' or account_type_id='40000'">
  <td>
  </td>
  <td onclick="location.href='{$link_prefix}ledger&amp;account_id={id}';">
    <xsl:value-of select="running_balance"/>
  </td>
  </xsl:if>
  <!-- Running balance -->
  <xsl:if test="account_type_id='10000' or account_type_id='50000'">
  <td onclick="location.href='{$link_prefix}ledger&amp;account_id={id}';">
    <xsl:value-of select="running_balance"/>
  </td>
  <td>
  </td>
  </xsl:if>


  <!-- Account Edit -->
  <xsl:if test="/_R_/_get/nid='accounts'">
    <td>
      <a href="{$link_prefix}accounts-edit&amp;account_id={id}"
      id="{account_number}-e" title="account_id: {id}">
        <span class="i18n-edit">Edit</span>
      </a>
    </td>
  </xsl:if>

  <!-- Is this a customer account or a regular account? -->
  <xsl:if test="/_R_/_get/nid='customer-accounts'">
    <td>
      <a href="{$link_prefix}customer-statement&amp;account_id={id}">
        <span class="i18n-statement">Statement</span>
      </a>
    </td>
    <td>
      <a href="{$link_prefix}customer-edit&amp;account_id={id}"
        id="{account_number}-e">
        <span class="i18n-edit">Edit</span>
      </a>
    </td>
  </xsl:if>

  <td>
    <a id="{account_number}-d"
      href="#{$link_prefix}accounts-delete&amp;account_id={id}"
      onclick="account_delete({id}); return false;">
      <span class="i18n-delete">Delete</span>
    </a>
  </td>
</tr>


  </xsl:template>
</xsl:stylesheet>
