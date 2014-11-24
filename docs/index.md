---
layout: default
type: concepts
navgroup: docs
shortname: Docs
title: Core Docs
subtitle: Core concepts of how to work in Antha

add_permalinks: false
---

{% for p in site.pages %}

{% unless p.draft %}

{% if p.docs %}

{::options parse_block_html="true" /}
<div class="article">
## [{{ p.title }}]({{ p.url }})

<summary>
{{p.docs.description}}
</summary>
</div>
{% endif %}

{% endunless %}

{% endfor %}

<div style="margin-top:5em;">
_Have an idea for better docs? [Suggest it](https://github.com/antha-lang/docs/issues/new)!_
</div>
