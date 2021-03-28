package
{
   import asgui.core.Application;
   import asgui.managers.ConfigManager;
   import asgui.managers.SystemManager;
   import com.qq.GameGloble;
   import com.qq.constant.SystemConstant;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.logic.initData.IGameLoader;
   import com.qq.sound.AudioManager;
   import com.qq.utils.FileVerManager;
   import com.qq.utils.UrlManager;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.error.ErrorReport;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import org.as3commons.logging.api.getLogger;

   [SWF(width="1440", height="900", backgroundColor="0", frameRate="30")]
   public class Main extends SystemManager
   {
      
      public static const Param_Logging:int = 6;
      
      public static const Param_MsgCheck:int = 7;
       
      
      public const pvz_skin_swf:Class = Main_pvz_skin_swf;
      
      public const pvz_css:Class = Main_pvz_css;
      
      public const asgui_css:Class = Main_asgui_css;
      
      public const loading_class:Class = Main_loading_class;
      
      public function Main()
      {
         ConfigManager.impl.resourceUrlChangeFunc = function(param1:String):String
         {
            return UrlManager.getInstance().getUrl(0,param1);
         };
         super("asgui.xml?" + Math.random());
      }
      
      private function resourceUrlChangeFunc(param1:String) : String
      {
         return UrlManager.getUrl(0,param1);
      }
      
      public function init(param1:Array) : void
      {
         var _loc2_:MovieClip = null;
         AudioManager.getInstance().init(stage);
         GameGloble.loader = this.parent as IGameLoader;
         this.data = param1;
         FileVerManager.getInstance().load(param1[SystemConstant.Param_FileVer]);
         if(Application.application)
         {
            Application.application["init"](param1);
            Application.application["start"]();
         }
         if(param1[Param_Logging] != null)
         {
            this.initLogging(param1[Param_Logging]);
         }
         if(param1[Param_MsgCheck] != null)
         {
            _loc2_ = param1[Param_MsgCheck] as MovieClip;
            if(_loc2_ != null)
            {
               GameGloble.msgCheckFunc = _loc2_["!"];
            }
         }
         this.initErrorReport();
         new PvzPreloader(stage,parent["setProgress"],Init);
      }
      
      private function initLogging(param1:DisplayObject) : void
      {
         if(param1 != null)
         {
            stage.addChild(param1);
            getLogger().debug("Test Output");
         }
      }
      
      private function initErrorReport() : void
      {
         ErrorReport.getInstance().init(this.loaderInfo,LoginServerCmd.sendClientErrorTrack);
      }
      
      public function start() : void
      {
         UtilsManager.registerExitFunc();
         GameFlowCmd.finishLoad();
      }
      
      private function _include() : void
      {
      }
   }
}
