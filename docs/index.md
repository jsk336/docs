---
layout: default
type: concepts
navgroup: docs
shortname: Docs
title: Core Docs
subtitle: Core concepts of how to work in Antha

add_permalinks: false
---

{% for p in site.categories.docs %}

{% unless p.draft %}

{::options parse_block_html="true" /}
<div class="article">
## [{{ p.title }}]({{ p.url }})

<!-- <span class="tags">
{% for tag in p.tags %}<span>{{ tag }}</span>{% endfor %}
</span> -->

 <summary>
{{p.excerpt}}
 </summary>
</div>

{% endunless %}

{% endfor %}

<div style="margin-top:5em;">
_Have an idea for an article? [Suggest it](https://github.com/Synthace/docs/issues/new)!_
</div>
