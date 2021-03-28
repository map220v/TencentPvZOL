package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NoEndFuben_Role_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndFuben_Role_SC";
      
      public static const FIRST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Role_SC.first","first",1 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndFuben_Role);
      
      public static const PREV:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Role_SC.prev","prev",2 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndFuben_Role);
      
      public static const SELF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Role_SC.self","self",3 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndFuben_Role);
       
      
      private var first$field:Dto_NoEndFuben_Role;
      
      private var prev$field:Dto_NoEndFuben_Role;
      
      private var self$field:Dto_NoEndFuben_Role;
      
      public function Cmd_NoEndFuben_Role_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndFuben_Role_SC.$MessageID;
      }
      
      public function clearFirst() : void
      {
         this.first$field = null;
      }
      
      public function get hasFirst() : Boolean
      {
         return this.first$field != null;
      }
      
      public function set first(param1:Dto_NoEndFuben_Role) : void
      {
         this.first$field = param1;
      }
      
      public function get first() : Dto_NoEndFuben_Role
      {
         return this.first$field;
      }
      
      public function clearPrev() : void
      {
         this.prev$field = null;
      }
      
      public function get hasPrev() : Boolean
      {
         return this.prev$field != null;
      }
      
      public function set prev(param1:Dto_NoEndFuben_Role) : void
      {
         this.prev$field = param1;
      }
      
      public function get prev() : Dto_NoEndFuben_Role
      {
         return this.prev$field;
      }
      
      public function clearSelf() : void
      {
         this.self$field = null;
      }
      
      public function get hasSelf() : Boolean
      {
         return this.self$field != null;
      }
      
      public function set self(param1:Dto_NoEndFuben_Role) : void
      {
         this.self$field = param1;
      }
      
      public function get self() : Dto_NoEndFuben_Role
      {
         return this.self$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFirst)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.first$field);
         }
         if(this.hasPrev)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.prev$field);
         }
         if(this.hasSelf)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.self$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Role_SC.first cannot be set twice.");
                  }
                  _loc3_++;
                  this.first = new Dto_NoEndFuben_Role();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.first);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Role_SC.prev cannot be set twice.");
                  }
                  _loc4_++;
                  this.prev = new Dto_NoEndFuben_Role();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.prev);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Role_SC.self cannot be set twice.");
                  }
                  _loc5_++;
                  this.self = new Dto_NoEndFuben_Role();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.self);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
