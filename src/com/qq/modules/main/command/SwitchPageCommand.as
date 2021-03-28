package com.qq.modules.main.command
{
   import asgui.utils.DisplayUtil;
   import com.qq.display.ScreenViewContainer;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   
   public class SwitchPageCommand extends BasicCommand
   {
       
      
      [Inject]
      public var event:CommonEvent;
      
      public function SwitchPageCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var viewClass:Class = null;
         var view:DisplayObject = null;
         var mediator:BasicScreenMediator = null;
         var viewClassName:String = this.event.readCustomParam_String("pageName");
         var isClean:Boolean = true;
         if(this.event.hasCustmeParam("isClean"))
         {
            isClean = this.event.readCustomParam("isClean");
         }
         if(viewClassName == "")
         {
            DisplayUtil.removeAllChildren(ScreenViewContainer.getInstance().bglayer);
            return;
         }
         try
         {
            viewClass = getDefinitionByName(viewClassName) as Class;
         }
         catch(err:Error)
         {
         }
         if(viewClass != null)
         {
            if(isClean)
            {
               DisplayUtil.removeAllChildren(ScreenViewContainer.getInstance().bglayer);
            }
            view = injector.instantiate(viewClass);
            ScreenViewContainer.getInstance().bglayer.addChild(view);
            mediator = mediatorMap.retrieveMediator(view) as BasicScreenMediator;
            if(mediator != null)
            {
               mediator.reset(this.event.param);
            }
         }
      }
   }
}
