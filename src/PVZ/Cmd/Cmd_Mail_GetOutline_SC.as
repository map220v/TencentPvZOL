package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mail_GetOutline_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mail_GetOutline_SC";
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mail_GetOutline_SC.totalNum","totalNum",1 << 3 | WireType.VARINT);
      
      public static const MAILOUTLINE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mail_GetOutline_SC.mailOutline","mailOutline",2 << 3 | WireType.LENGTH_DELIMITED,Dto_MailOutline);
      
      public static const NUMMAX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mail_GetOutline_SC.numMax","numMax",3 << 3 | WireType.VARINT);
      
      public static const HASATTACHMENTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mail_GetOutline_SC.hasAttachmentNum","hasAttachmentNum",4 << 3 | WireType.VARINT);
       
      
      private var totalNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var mailOutline:Array;
      
      private var numMax$field:uint;
      
      private var hasAttachmentNum$field:uint;
      
      public function Cmd_Mail_GetOutline_SC()
      {
         this.mailOutline = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mail_GetOutline_SC.$MessageID;
      }
      
      public function clearTotalNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.totalNum$field = new uint();
      }
      
      public function get hasTotalNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set totalNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.totalNum$field = param1;
      }
      
      public function get totalNum() : uint
      {
         return this.totalNum$field;
      }
      
      public function clearNumMax() : void
      {
         this.hasField$0 &= 4294967293;
         this.numMax$field = new uint();
      }
      
      public function get hasNumMax() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set numMax(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.numMax$field = param1;
      }
      
      public function get numMax() : uint
      {
         return this.numMax$field;
      }
      
      public function clearHasAttachmentNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasAttachmentNum$field = new uint();
      }
      
      public function get hasHasAttachmentNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasAttachmentNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.hasAttachmentNum$field = param1;
      }
      
      public function get hasAttachmentNum() : uint
      {
         return this.hasAttachmentNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasTotalNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.totalNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.mailOutline.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mailOutline[_loc2_]);
            _loc2_++;
         }
         if(this.hasNumMax)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.numMax$field);
         }
         if(this.hasHasAttachmentNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.hasAttachmentNum$field);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_GetOutline_SC.totalNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.totalNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.mailOutline.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MailOutline()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_GetOutline_SC.numMax cannot be set twice.");
                  }
                  _loc4_++;
                  this.numMax = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_GetOutline_SC.hasAttachmentNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasAttachmentNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
