---
layout: home
title: Welcome
---

<section id="future" class="main-bg">
  <div class="panel left">
    <img src="/images/logos/a-logo.png">
    <summary>
      <h1>Coding Biology</h1>
      <p>Antha make it easy to rapidly compose biological work flows using individually testable and composable Antha Elements.</p>
      <a href="/docs/start/introduction.html">
        <paper-button raised unresolved>
          <core-icon icon="archive"></core-icon> Get {{site.project_title}}
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

<section id="designer" class="main-purple">
  <div class="panel">
    <summary style="transform: translateZ(0);">
      <h1>Designer</h1>
      <a href="/tools/designer/" target="_blank">
        <img src="/images/flow-gui.png" alt="Launch the designer tool" title="Launch the designer tool">
      </a>
      <div>
        <p>
        Composer is a visual tool for wiring workflows using {{site.project_title}}. Rapidly define and execute your experiments.
        </p>
        <a href="/tools/designer/" target="_blank">
          <paper-button>
            <core-icon icon="arrow-forward"></core-icon> Learn More
          </paper-button>
        </a>
      </div>
    </summary>
  </div>
</section>

<section id="everything-element" class="main-purple">
  <div class="panel right">
    <summary>
      <h1>Everything is an element</h1>
      <p>From <code>&lt;a&gt;</code> to <code>&lt;select&gt;</code>, elements are the building blocks of HTML. But modern applications have outgrown these built-in elements, forcing app developers to rely on JavaScript frameworks to provide dynamic, custom behavior.  The resulting apps are frequently complex and monolithic; a component developed for one may not work in another.
      <br><br>
      {{site.project_title}} puts elements back at the center of web development. With {{site.project_title}}, you can craft your own HTML elements and compose them into complete, complex applications that are scalable and maintainable.</p>
      <a href="/docs/start/everything.html">
        <paper-button>
          <core-icon icon="arrow-forward"></core-icon> Learn more
        </paper-button>
      </a>
    </summary>
    <img src="/images/logos/p-elements.svg">
  </div>
</section>
