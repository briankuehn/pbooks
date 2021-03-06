<!--
Program: PBooks
Component: customer_form.xsl
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
	<xsl:include href="html_main.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="i18n"/>

    <xsl:variable name="this_account"
		select="/_R_/account_get_by_id/account_get_by_id" />
    <xsl:variable name="account_meta"
		select="/_R_/account_meta_get/account_meta_get" />

<!--
The form is validated via a javascript library included in the end
of main.xsl. Form input elements have attributes like required="1" if they
are to be validated. -->
<form method="post" onSubmit="return validateStandard(this, 'myerror');">

	<!-- UPDATE OR CREATE -->
	<xsl:if test="$this_account/id">
		<input type="hidden" name="my_action" value="update" />
		<input type="hidden" value="{/_R_/_get/account_id}" name="account_id" />
	</xsl:if>
	<xsl:if test="not($this_account/id)">
		<input type="hidden" name="my_action" value="create"/>
	</xsl:if>

	<!-- If there is already an account with the same name, display error. -->
	<xsl:if test="/_R_/account_duplicate_check">
		<div class="error" id="my_error">
			<img src="{$path_prefix}{/_R_/runtime/icon_set}/exclamation.png"/>
			Error: <xsl:value-of select="//error[key='account_duplicate']/value"/>
		</div>
	</xsl:if>
	<!-- End error -->

	<!-- customer accounts are "special" asset accounts - type 10000 -->
	<input type="hidden" name="account_type_id" value="10000"/>
	<table class="form-table" cellpadding="10">
		<tr>
			<td>
				<xsl:value-of select="$i18n/customer_name"/>:
			</td>
			<td>
				<input type="text" name="name"
					value="{$this_account/name|//_post/name}" required="1"
					err="{//error[key='missing_account_name']/value}"/>
			</td>
		</tr>

		<!-- META DATA -->
		<input type="hidden" name="has_checks" value="off" />
		<input type="hidden" name="takes_deposits" value="off" />
		<input type="hidden" name="accounts_receivable_account" value="on"  />
		<input type="hidden" name="cash_account" value="off" />

		<!-- Follow a similar pattern as company options -->
		<xsl:for-each select="//meta/meta_key[@category='address']">
			<xsl:variable name="my_option" select="."/>
			<tr>
				<td>
					<xsl:value-of select="$i18n/*[local-name()=$my_option]"/>:
				</td>
				<td>
					<input type="text" name="{$my_option}"
						value="{$account_meta[meta_key=$my_option]/meta_value}"/>
				</td>
			</tr>
		</xsl:for-each>
		<!-- END META -->
		<tr>
			<td>
				<xsl:value-of select="$i18n/account_number"/>:
			</td>
			<td>
				<input type="text" name="account_number" required="1"
				err="{//error[key='missing_account_number']/value}"
				value="{$this_account/account_number|//_post/account_number}"/>
			</td>
		</tr>
		<tr>
			<td>
				<xsl:value-of select="$i18n/desc"/>:
			</td>
			<td>
				<textarea name="description" cols="40" rows="6">
					<xsl:value-of
						select="//account_get_by_id/account_get_by_id/description|//_post/description"/>&#160;
				</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<xsl:value-of select="$i18n/group"/>:
			</td>
			<td>
				<select name="group_id">
					<xsl:for-each select="//get_account_groups/get_account_groups">
						<option value="{id}" id="g_{id}">
							<xsl:value-of select="name"/>
						</option>
					</xsl:for-each>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<xsl:value-of select="$i18n/email_invoices"/>:
			</td>
			<td>
				<input type="checkbox" name="email_invoices"/>
			</td>
		</tr>
		<tr>
			<td>
				<xsl:value-of select="$i18n/mail_invoices"/>:
			</td>
			<td>
				<input type="checkbox" name="mail_invoices"/>
			</td>
		</tr>
		<tr>
			<td>
			  <!-- NEW i18n TECHNIQUE AS OF NOV 2009 -->
				<label for="hide">
				  <span id="i18n-hide_this_account">Hide Account</span>
        </label>:
			</td>
			<td>
				<input type="checkbox" name="hide" id="hide">
					<xsl:if test="//account_get_by_id/account_get_by_id/hide='on'">
						<xsl:attribute name="checked">checked</xsl:attribute>
					</xsl:if>
				</input>
			</td>
		</tr>
	</table>
	<div style="text-align: center; margin-top: 20px;">
		<input type="submit" value="Save" name="submit" />
		<input type="button" value="Cancel"
			onclick="window.location.href='{$link_prefix}customer-accounts'"/>
	</div>
</form>

<script type="text/javascript">
	$("#g_"+<xsl:value-of select="$this_account/group_id"/>).attr("selected","selected");
</script>


	</xsl:template>
</xsl:stylesheet>