package tencent.tools.behaviourTrees.core
{
   public class BaseNode
   {
      
      private static var INS:int = 0;
       
      
      protected var childNodes:Vector.<BaseNode>;
      
      protected var parentNode:BaseNode;
      
      protected var rootNode:BaseNode;
      
      protected var nodeType:int;
      
      protected var childNodeNum:int = 0;
      
      public var aiKey:int;
      
      public var aiTypeKey:int;
      
      public var nodeName:String;
      
      public var ID:int;
      
      public var isLock:Boolean;
      
      public function BaseNode()
      {
         super();
         this.childNodes = new Vector.<BaseNode>();
         this.ID = INS++;
      }
      
      public function setDynamicParams(param1:Array) : void
      {
      }
      
      public function setStaticParams(param1:Array) : void
      {
      }
      
      public function calculate() : Boolean
      {
         return false;
      }
      
      public final function setParentNode(param1:BaseNode) : void
      {
         this.parentNode = param1;
      }
      
      public final function setRootNode(param1:BaseNode) : void
      {
         this.rootNode = param1;
      }
      
      public final function addNode(param1:BaseNode) : void
      {
         param1.setParentNode(this);
         ++this.childNodeNum;
         this.childNodes.push(param1);
      }
      
      public final function removeChildNode(param1:BaseNode) : void
      {
         var _loc2_:int = this.childNodes.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.childNodes[_loc3_] === param1)
            {
               this.childNodes.splice(_loc3_,1);
               --this.childNodeNum;
               _loc3_ = _loc2_;
            }
            _loc3_++;
         }
      }
      
      public function debug(param1:Boolean) : void
      {
      }
      
      public function dispose() : void
      {
         var _loc1_:int = this.childNodes.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.childNodes[_loc2_].dispose();
            _loc2_++;
         }
         this.childNodeNum = 0;
         this.childNodes = null;
         this.parentNode = null;
      }
   }
}
