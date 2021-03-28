package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_SysNotice extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SysNotice";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SysNotice.id","id",1 << 3 | WireType.VARINT);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SysNotice.title","title",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SysNotice.time","time",3 << 3 | WireType.VARINT);
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SysNotice.content","content",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ISIMPORTANT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_SysNotice.isImportant","isImportant",5 << 3 | WireType.VARINT);
      
      public static const SPLAT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SysNotice.sPlat","sPlat",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const EXPIRETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SysNotice.expireTime","expireTime",7 << 3 | WireType.VARINT);
      
      public static const SUBTITLE1:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SysNotice.subtitle1","subtitle1",8 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SUBTITLE2:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SysNotice.subtitle2","subtitle2",9 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const BEMPHASIZE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_SysNotice.bEmphasize","bEmphasize",10 << 3 | WireType.VARINT);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var title$field:String;
      
      private var time$field:uint;
      
      private var content$field:String;
      
      private var isImportant$field:Boolean;
      
      private var sPlat$field:String;
      
      private var expireTime$field:uint;
      
      private var subtitle1$field:String;
      
      private var subtitle2$field:String;
      
      private var bEmphasize$field:Boolean;
      
      public function Dto_SysNotice()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SysNotice.$MessageID;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967294;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
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
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      public function clearContent() : void
      {
         this.content$field = null;
      }
      
      public function get hasContent() : Boolean
      {
         return this.content$field != null;
      }
      
      public function set content(param1:String) : void
      {
         this.content$field = param1;
      }
      
      public function get content() : String
      {
         return this.content$field;
      }
      
      public function clearIsImportant() : void
      {
         this.hasField$0 &= 4294967291;
         this.isImportant$field = new Boolean();
      }
      
      public function get hasIsImportant() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set isImportant(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.isImportant$field = param1;
      }
      
      public function get isImportant() : Boolean
      {
         return this.isImportant$field;
      }
      
      public function clearSPlat() : void
      {
         this.sPlat$field = null;
      }
      
      public function get hasSPlat() : Boolean
      {
         return this.sPlat$field != null;
      }
      
      public function set sPlat(param1:String) : void
      {
         this.sPlat$field = param1;
      }
      
      public function get sPlat() : String
      {
         return this.sPlat$field;
      }
      
      public function clearExpireTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.expireTime$field = new uint();
      }
      
      public function get hasExpireTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set expireTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.expireTime$field = param1;
      }
      
      public function get expireTime() : uint
      {
         return this.expireTime$field;
      }
      
      public function clearSubtitle1() : void
      {
         this.subtitle1$field = null;
      }
      
      public function get hasSubtitle1() : Boolean
      {
         return this.subtitle1$field != null;
      }
      
      public function set subtitle1(param1:String) : void
      {
         this.subtitle1$field = param1;
      }
      
      public function get subtitle1() : String
      {
         return this.subtitle1$field;
      }
      
      public function clearSubtitle2() : void
      {
         this.subtitle2$field = null;
      }
      
      public function get hasSubtitle2() : Boolean
      {
         return this.subtitle2$field != null;
      }
      
      public function set subtitle2(param1:String) : void
      {
         this.subtitle2$field = param1;
      }
      
      public function get subtitle2() : String
      {
         return this.subtitle2$field;
      }
      
      public function clearBEmphasize() : void
      {
         this.hasField$0 &= 4294967279;
         this.bEmphasize$field = new Boolean();
      }
      
      public function get hasBEmphasize() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set bEmphasize(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.bEmphasize$field = param1;
      }
      
      public function get bEmphasize() : Boolean
      {
         return this.bEmphasize$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasTitle)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.title$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
         }
         if(this.hasContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.content$field);
         }
         if(this.hasIsImportant)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.isImportant$field);
         }
         if(this.hasSPlat)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.sPlat$field);
         }
         if(this.hasExpireTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.expireTime$field);
         }
         if(this.hasSubtitle1)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_STRING(param1,this.subtitle1$field);
         }
         if(this.hasSubtitle2)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_STRING(param1,this.subtitle2$field);
         }
         if(this.hasBEmphasize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_BOOL(param1,this.bEmphasize$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_SysNotice.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.title cannot be set twice.");
                  }
                  _loc4_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.time cannot be set twice.");
                  }
                  _loc5_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.content cannot be set twice.");
                  }
                  _loc6_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.isImportant cannot be set twice.");
                  }
                  _loc7_++;
                  this.isImportant = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.sPlat cannot be set twice.");
                  }
                  _loc8_++;
                  this.sPlat = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.expireTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.expireTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.subtitle1 cannot be set twice.");
                  }
                  _loc10_++;
                  this.subtitle1 = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.subtitle2 cannot be set twice.");
                  }
                  _loc11_++;
                  this.subtitle2 = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SysNotice.bEmphasize cannot be set twice.");
                  }
                  _loc12_++;
                  this.bEmphasize = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
