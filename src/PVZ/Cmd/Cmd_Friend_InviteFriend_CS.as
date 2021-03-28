package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Friend_InviteFriend_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Friend_InviteFriend_CS";
      
      public static const UIN:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_InviteFriend_CS.uin","uin",1 << 3 | WireType.VARINT);
      
      public static const INVITEPLAT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Friend_InviteFriend_CS.invitePlat","invitePlat",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var uin:Array;
      
      private var invitePlat$field:String;
      
      public function Cmd_Friend_InviteFriend_CS()
      {
         this.uin = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Friend_InviteFriend_CS.$MessageID;
      }
      
      public function clearInvitePlat() : void
      {
         this.invitePlat$field = null;
      }
      
      public function get hasInvitePlat() : Boolean
      {
         return this.invitePlat$field != null;
      }
      
      public function set invitePlat(param1:String) : void
      {
         this.invitePlat$field = param1;
      }
      
      public function get invitePlat() : String
      {
         return this.invitePlat$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.uin.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.uin[_loc2_]);
            _loc2_++;
         }
         if(this.hasInvitePlat)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.invitePlat$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if((_loc4_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.uin);
                  }
                  else
                  {
                     this.uin.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_InviteFriend_CS.invitePlat cannot be set twice.");
                  }
                  _loc3_++;
                  this.invitePlat = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
