package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MailOutline extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MailOutline";
      
      public static const MAILUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MailOutline.mailUId","mailUId",1 << 3 | WireType.VARINT);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MailOutline.time","time",2 << 3 | WireType.VARINT);
      
      public static const SOURCETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MailOutline.sourceType","sourceType",3 << 3 | WireType.VARINT);
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MailOutline.type","type",4 << 3 | WireType.VARINT);
      
      public static const SENDROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MailOutline.sendRoleId","sendRoleId",5 << 3 | WireType.VARINT);
      
      public static const SENDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MailOutline.sendName","sendName",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SENDFACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MailOutline.sendFaceId","sendFaceId",7 << 3 | WireType.VARINT);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MailOutline.status","status",8 << 3 | WireType.VARINT);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MailOutline.title","title",9 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ATTACHMENT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_MailOutline.attachment","attachment",10 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const SENDQQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MailOutline.sendQQFaceURL","sendQQFaceURL",11 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var mailUId$field:Int64;
      
      private var time$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sourceType$field:uint;
      
      private var type$field:uint;
      
      private var sendRoleId$field:Int64;
      
      private var sendName$field:String;
      
      private var sendFaceId$field:uint;
      
      private var status$field:uint;
      
      private var title$field:String;
      
      public var attachment:Array;
      
      private var sendQQFaceURL$field:String;
      
      public function Dto_MailOutline()
      {
         this.attachment = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MailOutline.$MessageID;
      }
      
      public function clearMailUId() : void
      {
         this.mailUId$field = null;
      }
      
      public function get hasMailUId() : Boolean
      {
         return this.mailUId$field != null;
      }
      
      public function set mailUId(param1:Int64) : void
      {
         this.mailUId$field = param1;
      }
      
      public function get mailUId() : Int64
      {
         return this.mailUId$field;
      }
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      public function clearSourceType() : void
      {
         this.hasField$0 &= 4294967293;
         this.sourceType$field = new uint();
      }
      
      public function get hasSourceType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set sourceType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.sourceType$field = param1;
      }
      
      public function get sourceType() : uint
      {
         return this.sourceType$field;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967291;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearSendRoleId() : void
      {
         this.sendRoleId$field = null;
      }
      
      public function get hasSendRoleId() : Boolean
      {
         return this.sendRoleId$field != null;
      }
      
      public function set sendRoleId(param1:Int64) : void
      {
         this.sendRoleId$field = param1;
      }
      
      public function get sendRoleId() : Int64
      {
         return this.sendRoleId$field;
      }
      
      public function clearSendName() : void
      {
         this.sendName$field = null;
      }
      
      public function get hasSendName() : Boolean
      {
         return this.sendName$field != null;
      }
      
      public function set sendName(param1:String) : void
      {
         this.sendName$field = param1;
      }
      
      public function get sendName() : String
      {
         return this.sendName$field;
      }
      
      public function clearSendFaceId() : void
      {
         this.hasField$0 &= 4294967287;
         this.sendFaceId$field = new uint();
      }
      
      public function get hasSendFaceId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set sendFaceId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.sendFaceId$field = param1;
      }
      
      public function get sendFaceId() : uint
      {
         return this.sendFaceId$field;
      }
      
      public function clearStatus() : void
      {
         this.hasField$0 &= 4294967279;
         this.status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.status$field = param1;
      }
      
      public function get status() : uint
      {
         return this.status$field;
      }
      
      public function clearTitle() : void
      {
         this.title$field = null;
      }
      
      public function get hasTitle() : Boolean
      {
         return this.title$field != null;
      }
      
      public function set title(param1:String) : void
      {
         this.title$field = param1;
      }
      
      public function get title() : String
      {
         return this.title$field;
      }
      
      public function clearSendQQFaceURL() : void
      {
         this.sendQQFaceURL$field = null;
      }
      
      public function get hasSendQQFaceURL() : Boolean
      {
         return this.sendQQFaceURL$field != null;
      }
      
      public function set sendQQFaceURL(param1:String) : void
      {
         this.sendQQFaceURL$field = param1;
      }
      
      public function get sendQQFaceURL() : String
      {
         return this.sendQQFaceURL$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasMailUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.mailUId$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
         }
         if(this.hasSourceType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.sourceType$field);
         }
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasSendRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT64(param1,this.sendRoleId$field);
         }
         if(this.hasSendName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.sendName$field);
         }
         if(this.hasSendFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.sendFaceId$field);
         }
         if(this.hasStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.status$field);
         }
         if(this.hasTitle)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_STRING(param1,this.title$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.attachment.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.attachment[_loc2_]);
            _loc2_++;
         }
         if(this.hasSendQQFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_STRING(param1,this.sendQQFaceURL$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.mailUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.mailUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.time cannot be set twice.");
                  }
                  _loc4_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.sourceType cannot be set twice.");
                  }
                  _loc5_++;
                  this.sourceType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.type cannot be set twice.");
                  }
                  _loc6_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.sendRoleId cannot be set twice.");
                  }
                  _loc7_++;
                  this.sendRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.sendName cannot be set twice.");
                  }
                  _loc8_++;
                  this.sendName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.sendFaceId cannot be set twice.");
                  }
                  _loc9_++;
                  this.sendFaceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.status cannot be set twice.");
                  }
                  _loc10_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.title cannot be set twice.");
                  }
                  _loc11_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 10:
                  this.attachment.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MailOutline.sendQQFaceURL cannot be set twice.");
                  }
                  _loc12_++;
                  this.sendQQFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
