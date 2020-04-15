<template>
   <div class="popover-menu">
       <div class="popover-menu-container">
           <header class="header">
                <div class="header-left">
                <img class="deepexi-logo" src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/logo_white(1).svg" alt="" @click="toOfficial()">
                <span class="dot">·</span>
                <img class="design-logo" src="https://deepexi.oss-cn-shenzhen.aliyuncs.com/deepexi-design/Design.svg"/>
                </div>
               <i class="el-icon-close" @click="handleClose"></i>
           </header>
           <div class="menu-list">
               <ul>
                   <li>
                       <router-link
                               active-class="active"
                               :to="`/${ lang }/guide`">{{ langConfig.designlang }}
                       </router-link>
                   </li>
                   <li>
                       <router-link
                               active-class="active"
                               :to="`/${ lang }/component`">{{ langConfig.components }}
                       </router-link>
                   </li>
                   <li>
                       <router-link
                               active-class="active"
                               :to="`/${ lang }/resource`"
                               exact>{{ langConfig.resource }}
                       </router-link>
                   </li>
               </ul>
           </div>
       </div>
   </div>
</template>

<script>
    import compoLang from '../i18n/component.json';
    export default {
      name: 'popover-menu',
      computed: {
        lang() {
          return this.$route.path.split('/')[1] || 'zh-CN';
        },
        langConfig() {
          return compoLang.filter(config => config.lang === this.lang)[0]['header'];
        }
      },
      methods: {
        handleClose() {
          this.$emit('handleClose');
        },
        toOfficial() {
          window.open('http://cloud.deepexi.top/#/');
        }
      }
    };
</script>

<style scoped>
@media (max-width: 768px) {
  .popover-menu {
    position: absolute;
    background-color: #1E1F22;
    width: 100%;
    height: 100%;
    z-index: 1;

    .popover-menu-container {
      padding: 0 20px;
    }

    .el-icon-close {
      color: white;
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

    .menu-list {
      color: #fff;
      padding: 0 30px;
      margin-top: 16px;
      font-size: 15px;

        li {
          list-style: none;
          height: 50px;
          line-height: 50px;
          border-bottom: 1px solid rgba(255,255,255,0.15);
        }

        a {
          color: #fff;
          display: block;
        }
    }
  }
}
</style>