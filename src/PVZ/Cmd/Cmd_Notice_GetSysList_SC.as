package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Notice_GetSysList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Notice_GetSysList_SC";
      
      public static const SYSNOTICE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Notice_GetSysList_SC.sysNotice","sysNotice",1 << 3 | WireType.LENGTH_DELIMITED,Dto_SysNotice);
      
      public static const HASUNREAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Notice_GetSysList_SC.hasUnread","hasUnread",2 << 3 | WireType.VARINT);
      
      public static const SPIC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Notice_GetSysList_SC.sPic","sPic",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const BSHOWPIC:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Notice_GetSysList_SC.bShowPic","bShowPic",4 << 3 | WireType.VARINT);
       
      
      public var sysNotice:Array;
      
      private var hasUnread$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var sPic$field:String;
      
      private var bShowPic$field:Boolean;
      
      public function Cmd_Notice_GetSysList_SC()
      {
         this.sysNotice = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Notice_GetSysList_SC.$MessageID;
      }
      
      public function clearHasUnread() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasUnread$field = new Boolean();
      }
      
      public function get hasHasUnread() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasUnread(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasUnread$field = param1;
      }
      
      public function get hasUnread() : Boolean
      {
         return this.hasUnread$field;
      }
      
      public function clearSPic() : void
      {
         this.sPic$field = null;
      }
      
      public function get hasSPic() : Boolean
      {
         return this.sPic$field != null;
      }
      
      public function set sPic(param1:String) : void
      {
         this.sPic$field = param1;
      }
      
      public function get sPic() : String
      {
         return this.sPic$field;
      }
      
      public function clearBShowPic() : void
      {
         this.hasField$0 &= 4294967293;
         this.bShowPic$field = new Boolean();
      }
      
      public function get hasBShowPic() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set bShowPic(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.bShowPic$field = param1;
      }
      
      public function get bShowPic() : Boolean
      {
         return this.bShowPic$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.sysNotice.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.sysNotice[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasUnread)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.hasUnread$field);
         }
         if(this.hasSPic)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.sPic$field);
         }
         if(this.hasBShowPic)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.bShowPic$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                  this.sysNotice.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_SysNotice()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Notice_GetSysList_SC.hasUnread cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasUnread = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Notice_GetSysList_SC.sPic cannot be set twice.");
                  }
                  _loc4_++;
                  this.sPic = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Notice_GetSysList_SC.bShowPic cannot be set twice.");
                  }
                  _loc5_++;
                  this.bShowPic = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
