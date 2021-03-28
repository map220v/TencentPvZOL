package asgui.controls
{
   import asgui.containers.Panel;
   import asgui.controls.alerts.AlertForm;
   import asgui.core.ScrollPolicy;
   import asgui.events.CloseEvent;
   import asgui.managers.PopUpManager;
   import flash.display.DisplayObjectContainer;
   
   public class Alert extends Panel
   {
      
      public static const YES:uint = 1;
      
      public static const NO:uint = 2;
      
      public static const OK:uint = 4;
      
      public static const CANCEL:uint = 8;
      
      public static const NONMODAL:uint = 32768;
      
      public static var defaultWidth:int = 400;
      
      public static var defaultHeight:int = 300;
      
      public static var createButtonFunction:Function = defaultCreateButtonFunction;
      
      public static var createTextFunction:Function = defaultCreateTextFunction;
      
      public static const STYLE:String = "Alert";
      
      private static var _cancelLabel:String = "CANCEL";
      
      private static var _noLabel:String = "NO";
      
      private static var _okLabel:String = "OK";
      
      private static var _yesLabel:String = "YES";
       
      
      protected var alertForm:AlertForm;
      
      public var buttonFlags:uint = 4;
      
      public var defaultButtonFlag:uint = 4;
      
      public var iconClass:Class;
      
      public var text:String = "";
      
      public function Alert()
      {
         super();
         this.verticalScrollPolicy = ScrollPolicy.OFF;
         this.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.name = "Alert";
      }
      
      private static function defaultCreateButtonFunction() : Button
      {
         return new Button();
      }
      
      private static function defaultCreateTextFunction() : Text
      {
         return new Text();
      }
      
      public static function Show(param1:String = "", param2:String = "", param3:uint = 4, param4:DisplayObjectContainer = null, param5:Function = null, param6:Class = null, param7:uint = 4, param8:Boolean = true) : Alert
      {
         var _loc9_:Boolean = !!(param3 & Alert.NONMODAL) ? false : true;
         var _loc10_:Alert;
         (_loc10_ = new Alert()).width = defaultWidth;
         _loc10_.height = defaultHeight;
         if(param3 & Alert.OK || param3 & Alert.CANCEL || param3 & Alert.YES || param3 & Alert.NO)
         {
            _loc10_.buttonFlags = param3;
         }
         if(param7 == Alert.OK || param7 == Alert.CANCEL || param7 == Alert.YES || param7 == Alert.NO)
         {
            _loc10_.defaultButtonFlag = param7;
         }
         _loc10_.text = param1;
         _loc10_.title = param2;
         _loc10_.iconClass = param6;
         if(param5 != null)
         {
            _loc10_.addEventListener(CloseEvent.CLOSE,param5);
         }
         PopUpManager.AddPopUp(_loc10_,param4,_loc9_,param8);
         return _loc10_;
      }
      
      public static function get cancelLabel() : String
      {
         return _cancelLabel;
      }
      
      public static function set cancelLabel(param1:String) : void
      {
         _cancelLabel = param1;
      }
      
      public static function get noLabel() : String
      {
         return _noLabel;
      }
      
      public static function set noLabel(param1:String) : void
      {
         _noLabel = param1;
      }
      
      public static function get okLabel() : String
      {
         return _okLabel;
      }
      
      public static function set okLabel(param1:String) : void
      {
         _okLabel = param1;
      }
      
      public static function get yesLabel() : String
      {
         return _yesLabel;
      }
      
      public static function set yesLabel(param1:String) : void
      {
         _yesLabel = param1;
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      public function Close() : void
      {
         this.removeEventListener(CloseEvent.CLOSE,this.CloseHandler);
         if(this.alertForm)
         {
            this.alertForm.Dispose();
            this.alertForm = null;
         }
         PopUpManager.RemovePopUp(this);
         Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      override public function OnAddedToStage() : void
      {
         super.OnAddedToStage();
         this.alertForm = new AlertForm(this);
         this.alertForm.top = 1;
         this.alertForm.bottom = 1;
         this.alertForm.left = 1;
         this.alertForm.right = 1;
         this.alertForm.alertButtonContainerHeight = this.styleDeclaration.alertButtonContainerHeight;
         this.alertForm.addEventListener(CloseEvent.CLOSE,this.CloseHandler);
         addChild(this.alertForm);
      }
      
      private function CloseHandler(param1:CloseEvent) : void
      {
         this.dispatchEvent(param1.clone());
         this.Close();
      }
   }
}
