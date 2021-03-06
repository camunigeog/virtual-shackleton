{if isSet ($integrationEnabled)}
	{include file='head.tpl'}
{else}
	{include file='cam/header.tpl'}
{/if}

<h1>{$article.title}</h1>

<p id="breadcrumb">You are in: &nbsp; <a href="{$baseUrl}/">Shackleton Online</a> &raquo; <a href="{$baseUrl}/articles/">Treasures from the SPRI collection</a> &raquo; Article</p>


<div class="grid  mb">
  <div class="u-2/3--portrait-tab-and-up grid__cell">
    <strong>Expedition:</strong> <a href="{$article.expeditionLink}">{$article.expedition}</a>
    <br><strong>Materials:</strong> {(($article.materials) ? implode (', ', $article.materials) : '<em class="comment">Unknown</em>')}
    <br><strong>Dimensions:</strong> {$article.dimensions}
  </div>
  <div class="u-1/3--portrait-tab-and-up grid__cell">
    <strong>Date:</strong> {$article.date}
    <br><strong>Ref no:</strong> {$article.id}
  </div>
</div>

{$article.briefDescription}

{if ($article.fullDescription)}
	<p class="comment">Physical description:</p>
{/if}

{$article.fullDescription}


{if ($article.id == 'N: 999a')}
	{include file='_video_chronometer.tpl'}
{/if}
{if ($article.id == 'Y: 2002/2/4')}
	{include file='_video_flag.tpl'}
{/if}


<div id="photoGallery" class="gallery">
  <div class="grid">
  {foreach from=$article.images item=image}
    <div class="u-1/2 u-1/2--portrait-tab-and-up grid__cell">
      <a class="photo" href="{$image.path}" data-size="{$image.width}x{$image.height}" data-title="{$article.title|htmlspecialchars}">
        <img src="{$image.path}" alt="{$article.title|htmlspecialchars}" />
      </a>
    </div>
  {/foreach}
  </div>
</div>

<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="pswp__bg"></div>
  <div class="pswp__scroll-wrap">
    <div class="pswp__container">
      <div class="pswp__item"></div>
      <div class="pswp__item"></div>
      <div class="pswp__item"></div>
    </div>
    <div class="pswp__ui pswp__ui--hidden">
      <div class="pswp__top-bar">
        <div class="pswp__counter"></div>
        <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
        <button class="pswp__button pswp__button--share" title="Share"></button>
        <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
        <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
        <div class="pswp__preloader">
          <div class="pswp__preloader__icn">
            <div class="pswp__preloader__cut">
              <div class="pswp__preloader__donut"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
        <div class="pswp__share-tooltip"></div>
      </div>
      <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"> </button>
      <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"> </button>
      <div class="pswp__caption">
        <div class="pswp__caption__center"></div>
      </div>
    </div>
  </div>
</div>


<h3>Other relevant information</h3>

<div class="grid">
  {foreach from=$article.associatedExpedition item=expedition}
  <div class="u-1/2 u-1/4--portrait-tab-and-up u-1/5--desktop grid__cell">
    <a class="mini-teaser" href="{$expedition.link}">
      <img src="{($expedition.squareImage) ? $expedition.squareImage : "$baseUrl/images/expeditions/expedition.jpg"}" alt="{$expedition.name}">
      <div class="mini-teaser__caption">
        <strong>{$expedition.name}</strong>
        <br>{$expedition.date}
      </div>
      <div class="mini-teaser__cta">View expedition &rarr;</div>
    </a>
  </div>
  {/foreach}
  {foreach from=$article.associatedPerson item=person}
  <div class="u-1/2 u-1/4--portrait-tab-and-up u-1/5--desktop grid__cell">
    <a class="mini-teaser" href="{$person.link}">
      <img src="{($person.image) ? $person.image : "$baseUrl/images/pioneers/person.jpg"}" alt="{$person.name}">
      <div class="mini-teaser__caption">
        <strong>{$person.name}</strong>
        <br>{$person.role|ucfirst}
      </div>
      <div class="mini-teaser__cta">View biography &rarr;</div>
    </a>
  </div>
  {/foreach}
</div>

<br><br>

{include file='search-form.tpl'}

{if isSet ($integrationEnabled)}
	{include file='foot.tpl'}
{else}
	{include file='cam/footer.tpl'}
{/if}