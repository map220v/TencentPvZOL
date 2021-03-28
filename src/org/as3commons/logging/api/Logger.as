package org.as3commons.logging.api
{
   import flash.utils.getTimer;
   import org.as3commons.logging.setup.ILogTarget;
   
   public final class Logger implements ILogger
   {
       
      
      public var debugTarget:ILogTarget;
      
      public var infoTarget:ILogTarget;
      
      public var warnTarget:ILogTarget;
      
      public var errorTarget:ILogTarget;
      
      public var fatalTarget:ILogTarget;
      
      private var _name:String;
      
      private var _shortName:String;
      
      private var _person:String;
      
      public function Logger(param1:String, param2:String = null)
      {
         super();
         this._name = param1;
         this._shortName = this._shortName = this._name.substr(this._name.lastIndexOf(".") + 1);
         this._person = param2;
      }
      
      public function debug(param1:*, param2:Array = null) : void
      {
         /*if(this.debugTarget)
         {
            this.debugTarget.log(this._name,this._shortName,32,getTimer(),param1,param2,this._person);
         }*/
         trace("AS3Log Debug: " + param1);
      }
      
      public function info(param1:*, param2:Array = null) : void
      {
         /*if(this.infoTarget)
         {
            this.infoTarget.log(this._name,this._shortName,16,getTimer(),param1,param2,this._person);
         }*/
         trace("AS3Log Info: " + param1);
      }
      
      public function warn(param1:*, param2:Array = null) : void
      {
         /*if(this.warnTarget)
         {
            this.warnTarget.log(this._name,this._shortName,8,getTimer(),param1,param2,this._person);
         }*/
         trace("AS3Log Warning: " + param1);
      }
      
      public function error(param1:*, param2:Array = null) : void
      {
         /*if(this.errorTarget)
         {
            this.errorTarget.log(this._name,this._shortName,4,getTimer(),param1,param2,this._person);
         }*/
         trace("AS3Log Error: " + param1);
      }
      
      public function fatal(param1:*, param2:Array = null) : void
      {
         /*if(this.fatalTarget)
         {
            this.fatalTarget.log(this._name,this._shortName,2,getTimer(),param1,param2,this._person);
         }*/
         trace("AS3Log Fatal: " + param1);
      }
      
      public function get debugEnabled() : Boolean
      {
         return this.debugTarget != null;
      }
      
      public function get infoEnabled() : Boolean
      {
         return this.infoTarget != null;
      }
      
      public function get warnEnabled() : Boolean
      {
         return this.warnTarget != null;
      }
      
      public function get errorEnabled() : Boolean
      {
         return this.errorTarget != null;
      }
      
      public function get fatalEnabled() : Boolean
      {
         return this.fatalTarget != null;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get shortName() : String
      {
         return this._shortName;
      }
      
      public function get person() : String
      {
         return this._person;
      }
      
      public function set allTargets(param1:ILogTarget) : void
      {
         this.debugTarget = this.infoTarget = this.warnTarget = this.errorTarget = this.fatalTarget = param1;
      }
      
      public function toString() : String
      {
         return "[Logger name=\'" + this._name + (!!this._person ? "@" + this._person : "") + "\']";
      }
   }
}
