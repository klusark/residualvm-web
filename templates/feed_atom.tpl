{* Published date. *}
{assign var='timezone_offset' value=$news[0]->getDate()|date_f:'Z'}
{assign var='updated' value=$news[0]->getDate()-$timezone_offset}
<?xml version="1.0" encoding="UTF-8" ?>
<feed xml:lang="en" xmlns="http://www.w3.org/2005/Atom">
	<id>{$baseurl}</id>
	<link rel="alternate" type="text/html" href="http://residual.sourceforge.net" />
	<link rel="self" type="application/atom+xml" href="{$baseurl}" />
	<title type="text">Residual news</title>
	<subtitle type="html"><![CDATA[Residual is a cross-platform 3D game interpreter.]]></subtitle>
	<author>
		<name>Residual team</name>
		<uri>http://residual.sourceforge.net/</uri>
	</author>
	<updated>{$updated|date_f:'Y-m-d\Th:i:s\Z'}</updated>
	{foreach from=$news item=n}
		{assign var='timezone_offset' value=$n->getDate()|date_f:'Z'}
		{assign var='updated' value=$n->getDate()-$timezone_offset}
		<entry xml:lang="en">
			<id>{$baseurl}news/archive/#{$n->getDate()|date_f:'Y-m-d'}</id>
			<link rel="alternate" href="{$baseurl}news/#{$n->getDate()|date_f:'Y-m-d'}" />
			<updated>{$updated|date_f:'Y-m-d\Th:i:s\Z'}</updated>
			<published>{$updated|date_f:'Y-m-d\Th:i:s\Z'}</published>
			<title type="html">{$n->getTitle()}</title>
			<content type="html" xml:base="http://residual.sourceforge.net"><![CDATA[{$n->getContent()}]]></content>
			{if $n->getAuthor() != ''}
			<author><name>{$n->getAuthor()}</name></author>
			{/if}
		</entry>
	{/foreach}
</feed>