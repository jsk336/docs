---
layout: home
title: Welcome to Antha
---

<section id="future" class="main-bg">
  <div class="panel left">
    <img src="/images/logos/a-logo-color-416.svg">
    <summary>
      <h1>Coding Biology</h1>
      <p>Antha make it easy to rapidly compose biological work flows using individually testable and composable Antha Elements.</p>
      <a href="/docs/intro.html">
        <paper-button raised unresolved>
          <core-icon icon="archive"></core-icon> Learn More
        </paper-button>
      </a>
      <a href="https://github.com/Synthace/antha">
        <paper-button class="github" unresolved>
          <core-icon icon="social:post-github"></core-icon> View on Github
        </paper-button>
      </a>
    </summary>
  </div>
</section>

<section id="learn" class="main-purple">
  <div class="panel right">
    <summary>
      <learn-tabs></learn-tabs>
    </summary>
  </div>
</section>

{% comment %}
<section id="featured">
  <div class="panel right">
    <summary>
        <feature-carousel interval="5000" flex unresolved>
        <div>
          <a href="/components/paper-elements/demo.html#core-toolbar" target="_blank">
            <img src="/images/sampler-paper.png">
          </a>
          <summary>
            <h1>Featured: material design</h1>
            <p>{{site.project_title}} brings an implementation of <a href="http://google.com/design/spec">material design</a> to the web. The paper elements range from controls to effects and user interaction.
            <br><br>
            <a href="/docs/elements/material.html">
              <paper-button>
                <core-icon icon="arrow-forward"></core-icon> Learn more
              </paper-button>
            </a>
            </p>
          </summary>
        </div>
        <div>
          <a href="/resources/video.html">
            <img src="/images/logos/polymer_video_thumb.jpg">
          </a>
          <!-- <div class="video">
            <iframe src="https://www.youtube.com/embed/videoseries?list=PLRAVCSU_HVYu-zlRaqArF8Ytwz1jlMOIM&theme=light&controls=2" frameborder="0" allowfullscreen></iframe>
          </div> -->
          <summary>
            <h1>Featured: Google I/O</h1>
            <p>Recap everything {{site.project_title}} at Google I/O 2014. Watch sessions videos and DevByte shorts.
            <br><br>
            <a href="/resources/video.html">
              <paper-button>
                <core-icon icon="drive-video"></core-icon> Watch
              </paper-button>
            </a>
            </p>
          </summary>
        </div>
      </feature-carousel>
    </summary>
  </div>
</section>
{% endcomment %}

<section id="composer" class="main-purple">
  <div class="panel">
    <summary style="transform: translateZ(0);">
      <h1>Composer</h1>
      <a href="/docs/flow-based-programming.html" target="_blank">
        <img src="/images/flow-gui.png" height="300" alt="Learn More About Composition" title="Learn More About Composition">
      </a>
      <div>
        <p>
        Composer is a visual tool for wiring workflows using {{site.project_title}}. Rapidly define and execute your experiments.
        </p>
        <a href="/docs/flow-based-programming.html/" target="_blank">
          <paper-button>
            <core-icon icon="arrow-forward"></core-icon> Learn More
          </paper-button>
        </a>
      </div>
    </summary>
  </div>
</section>

<section id="keep-in-touch" class="main-bg">
  <div class="panel right">
    <summary>
      <h1>Keep in Touch</h1>
      <p>Antha is under rapid and open development. You can subsribe to low volume updates as it progresses, or you can dive in to help build Antha faster</p>
	  <div layout horizontal justified>
		  <div></div>
		  <div>
	  		<a href="https://groups.google.com/a/antha-lang.org/group/antha-dev/boxsubscribe">
		  	  	<paper-button raised>
		  			<core-icon icon="mail"></core-icon> Keep in Touch
				</paper-button>
			</a>
		  </div>
		  <div></div>
		  <div>	
      		<a href="/docs/intro.html">
        		<paper-button raised>
          	  		<core-icon icon="arrow-forward"></core-icon> Learn more
        		</paper-button>
      	  	</a>
		  </div>
		  <div></div>
    </summary>
  </div>
</section>
