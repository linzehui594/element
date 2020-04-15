<style scoped>
  @import "~examples/assets/styles/index_canvas.scss";
  .banner {
    background-color: #1E1F22;
    text-align: center;

    .container {
      position: relative;
    }
  }
  .banner-desc {
    padding-top: 150px;
    padding-bottom: 64px;

    h1 {
      font-size: 50px;
      margin: 0;
      line-height: 78px;
      color: #FFF;
    }

    p {
      font-size: 20px;
      line-height: 28px;
      color: #FFF;
      opacity: .7;
      margin: 10px auto 5px;
      width: 69%;
    }
  }

  .banner-btn {
    padding-bottom: 154px;

    .el-button {
      width: 160px;
      font-size: 16px;
      vertical-align: bottom;
    }
    .el-button+.el-button {
      margin-left: 24px;
    }
  }

  .content {
    margin: 95px auto 110px;
    width: 1140px;
  }

  .design {
    width: 100%;
  }

  .design-desc {
    margin:0 0 32px 30px;

    h3 {
      color: #333643;
      margin: 0;
      font-size: 28px;
      line-height: 40px;
    }

    p {
      font-size: 20px;
      line-height: 28px;
      color: #333643;
      opacity: .7;
      margin: 12px 0 0 0;
    }

  }

  .design-cards {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    li {
      width: 33.33%;
      list-style: none;
      transition: background .4s;

      &:hover {
         background: #F5F6F9;
      }
    }

    img {
      width: 100%;
    }

    h3 {
      font-size: 20px;
      line-height:28px;
      color: #333643;
      margin: 20px 0 0 0;
    }

    p {
      font-size: 16px;
      color: #333643;
      opacity: .7;
      margin: 8px 0 0 0;
    }
  }
  .card {
    padding: 24px 30px 40px;
  }

  .header {
    width: 100%;
    display: flex;
    justify-content: space-between;
    height: 67px;
    align-items: center;
  }

  .header-left {
    display: flex;
    align-items: center;

    .deepexi-logo, .design-logo {
      cursor: pointer;
    }

    .design-logo {
      margin-top: 2px;
    }

    .dot {
      color: white;
      padding:0 5px;
      font-weight: 700;
    }
  }

  .el-icon-menu {
    display: none;
  }

  .nav {
    display: flex;
    align-items: center;

    li {
      list-style: none;
    }

    a {
      color: #fff;
      padding: 0 22px;
      font-size:14px;
    }
  }


  @media (max-width: 1140px) {
    .content {
      width: 100%;
      .design {
        width: 100%;
        margin: 0;
      }
    }
    .banner .container {
      width: 100%;
      box-sizing: border-box;
      position: relative;
      padding: 0 20px;
    }
  }

  @media (max-width: 768px) {
    .nav {
      display: none;
    }
    .el-icon-menu {
      display: block;
      font-size: 22px;
      color: white;
    }
    .banner-desc {
      padding-top: 50px;

      h1 {
        font-size: 30px;
      }

      p {
        font-size: 14px;
        width: 85%;
      }
    }

    .banner-btn {
      padding-bottom: 60px;

      .el-button {
        width: 120px;
      }

    }

    .design-desc {
      margin: 0 30px;

      h3 {
        font-size: 22px;
      }

      p {
        font-size: 15px;
      }
    }

    .design-cards {
      li {
        width: 100%;
      }
    }

    .card {
      padding: 24px 30px;

      h3 {
        font-size: 18px;
        margin: 8px 0;
      }

      p {
        font-size: 15px;
        margin: 5px 0;
      }
    }

    .nav {
      a {
        padding: 0 10px;
      }
    }

    .content {
      margin: 48px auto;
    }

  }

  @media (max-width: 375px) {
    .banner-desc {
      padding-top: 50px;
      h1 {
        font-size: 30px;
      }

      p {
        font-size: 13px;
        width: 90%;
      }
   }
  }
</style>
<template>
  <div>
    <popover-menu v-show="showNav" @handleClose="handleClose"></popover-menu>
    <div class="banner">
      <canvas id="canvas-1"></canvas>
      <canvas id="canvas-2"></canvas>
      <div class="container">
      <header class="header">
        <div class="header-left">
          <img class="deepexi-logo" src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/logo_white(1).svg" alt="" @click="toLink()">
          <span class="dot">·</span>
          <img class="design-logo" src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/Design.svg"/>
        </div>

        <i class="el-icon-menu" @click="handleOpen"></i>

        <!-- nav -->
          <ul class="nav">
            <li class="nav-item">
              <router-link
                      active-class="active"
                      :to="`/${ lang }/guide`">{{ langConfig.designlang }}
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                      active-class="active"
                      :to="`/${ lang }/component`">{{ langConfig.components }}
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                      active-class="active"
                      :to="`/${ lang }/resource`"
                      exact>{{ langConfig.resource }}
              </router-link>
            </li>

          </ul>
      </header>

        <div class="banner-desc">
          <h1>DEEPEXI Design</h1>
          <p>DEEPEXI Design是一个基于Element，由开源代码支持的设计系统，帮助团队快速开发SaaS应用，让设计者和开发者专注于更好的用户体验。</p>
        </div>
        <div class="banner-btn">
          <el-button type="primary" @click="$router.push(`/${ lang }/component`)">开始使用 <i class="el-icon-right"></i></el-button>
          <el-button @click="$router.push(`/${ lang }/guide`)">设计语言</el-button>
        </div>
      </div>
      </div>
    <div class="content">
      <div class="design">
        <div class="design-desc">
          <h3>设计指南和规范</h3>
          <p>使用我们的设计标准和开发资源来快速启动您的新项目</p>
        </div>
        <div class="design-cards">
          <li>
            <div class="card">
              <img src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/index_guide.png" alt="">
              <h3>设计指南</h3>
              <p>辅助设计人员在设计过程中做出决策，搭建出结构合理、高效易用的产品。</p>
            </div>
          </li>
          <li>
            <div class="card">
              <img src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/index_principle.png" alt="">
              <h3>设计原则</h3>
              <p>提供普适、抽象的评判标准和方向，为设计问题提供行之有效的向导或提示。</p>
            </div>
          </li>
          <li>
            <div class="card">
              <img src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/index_component.png" alt="">
              <h3>组件</h3>
              <p>使用前端框架封装的代码帮助工程师快速开发；覆盖大部分使用场景，满足各种功能需求。</p>
            </div>
          </li>
          <li>
            <div class="card">
              <img src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/index_schema.png" alt="">
              <h3>设计模式</h3>
              <p>可直接使用设计模式完成界面设计；也可以设计模式为起点，衍生出更具业务特性的解决方案。</p>
            </div>
          </li>
          <li>
            <div class="card">
              <img src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/index_subject.png" alt="">
              <h3>主题</h3>
              <p>提供默认的蓝色主题；也可自定义主题，可视化定制和管理站点主题、组件样式。</p>
            </div>
          </li>
          <li>
            <div class="card">
              <img src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/index_resource.png" alt="">
              <h3>设计资源</h3>
              <p>提供 DEEPEXI Design 相关设计资源下载，可快速搭建高保真视觉稿，提升产品设计效率。</p>
            </div>
          </li>
        </div>
      </div>
    </div>

  </div>
</template>
<script>
  import compoLang from '../../i18n/component.json';
  import { animation } from '../../index_canvas.js';

  export default {
    data() {
      return {
        showNav: false
      };
    },
    mounted() {
      animation();
    },
    computed: {
      lang() {
        return this.$route.path.split('/')[1] || 'zh-CN';
      },
      langConfig() {
        return compoLang.filter(config => config.lang === this.lang)[0]['header'];
      }
    },
    methods: {
      handleOpen() {
        this.showNav = true;
        document.body.setAttribute('overflow', 'hidden');
      },
      handleClose() {
        this.showNav = false;
        document.body.removeAttribute('overflow');
      },
      toLink() {
        window.open('http://cloud.deepexi.top/#/');
      }
    },
    beforeDestroy() {
      document.body.removeAttribute('overflow');
    }
  };
</script>
