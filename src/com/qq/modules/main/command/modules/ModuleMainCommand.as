package com.qq.modules.main.command.modules
{
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.data.BlitDataManager;
   import asgui.managers.LoaderManager;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.view.loading.MainStepLoadingBar;
   import com.qq.utils.LoadType;
   import flash.events.Event;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ModuleMainCommand extends StrongRobotlegCommand
   {
       
      
      private var loadingWd:MainStepLoadingBar;
      
      private var nextCmd:Function;
      
      private var args:Array;
      
      private var types:Vector.<int>;
      
      private var params:Vector.<Object>;
      
      public function ModuleMainCommand()
      {
         super();
      }
      
      public function gotoChooseStage() : void
      {
      }
      
      public function loadingForNextStep(param1:Vector.<String>, param2:Function, param3:Vector.<int> = null, param4:Vector.<Object> = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            if(param2 != null)
            {
               param2.apply(this,[this.args,param3,param4]);
            }
         }
         else
         {
            this.nextCmd = param2;
            this.types = param3;
            this.params = param4;
            _loc6_ = param1.length;
            this.args = [];
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc7_ = LoadType.BINARY;
               if(param3 != null && param3.length > _loc5_)
               {
                  _loc7_ = param3[_loc5_];
               }
               switch(_loc7_)
               {
                  case LoadType.LOADER:
                     this.args[_loc5_] = LoaderManager.GetLoader(param1[_loc5_],0);
                     break;
                  case LoadType.BLIT:
                     this.args[_loc5_] = BlitDataManager.GetBlitDataByUrl(param1[_loc5_]);
                     break;
                  case LoadType.BLIT_BONE:
                     BlitBoneManager.impl.getBoneDataByUrl(param1[_loc5_],true);
                     break;
                  default:
                     this.args[_loc5_] = LoaderManager.GetLoaderCollection(param1[_loc5_],false,0);
                     break;
               }
               _loc5_++;
            }
            if(LoaderManager.impl.isOpening)
            {
               LoaderManager.impl.addEventListener(Event.CLOSE,this.loaderManagerCloseHandler);
            }
            else
            {
               if(this.loadingWd)
               {
                  this.loadingWd.Close();
               }
               if(param2 != null)
               {
                  param2.apply(this,[this.args,param3,param4]);
                  param2 = null;
               }
            }
            CommonCmd.showLoading();
         }
      }
      
      protected function loaderManagerCloseHandler(param1:Event) : void
      {
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.loaderManagerCloseHandler);
         if(this.loadingWd)
         {
            this.loadingWd.Close();
         }
         if(this.nextCmd != null)
         {
            this.nextCmd.apply(this,[this.args,this.types,this.params]);
         }
         this.nextCmd = null;
         this.loadingWd = null;
      }
   }
}
