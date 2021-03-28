package PVZ.Protocol
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardFullInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Protocol.Dto_CardFullInfo";
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Protocol.Dto_CardFullInfo.baseInfo","baseInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_CardBaseInfo);
      
      public static const ATTRIBUTE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Protocol.Dto_CardFullInfo.attribute","attribute",2 << 3 | WireType.LENGTH_DELIMITED,Dto_CardAttribute);
      
      public static const ATTRIBUTEELE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Protocol.Dto_CardFullInfo.attributeEle","attributeEle",3 << 3 | WireType.LENGTH_DELIMITED,Dto_CardAttributeEle);
      
      public static const BUFFINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Protocol.Dto_CardFullInfo.buffInfo","buffInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_CardBuffInfo);
       
      
      private var baseInfo$field:Dto_CardBaseInfo;
      
      private var attribute$field:Dto_CardAttribute;
      
      public var attributeEle:Array;
      
      public var buffInfo:Array;
      
      public function Dto_CardFullInfo()
      {
         this.attributeEle = [];
         this.buffInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardFullInfo.$MessageID;
      }
      
      public function clearBaseInfo() : void
      {
         this.baseInfo$field = null;
      }
      
      public function get hasBaseInfo() : Boolean
      {
         return this.baseInfo$field != null;
      }
      
      public function set baseInfo(param1:Dto_CardBaseInfo) : void
      {
         this.baseInfo$field = param1;
      }
      
      public function get baseInfo() : Dto_CardBaseInfo
      {
         return this.baseInfo$field;
      }
      
      public function clearAttribute() : void
      {
         this.attribute$field = null;
      }
      
      public function get hasAttribute() : Boolean
      {
         return this.attribute$field != null;
      }
      
      public function set attribute(param1:Dto_CardAttribute) : void
      {
         this.attribute$field = param1;
      }
      
      public function get attribute() : Dto_CardAttribute
      {
         return this.attribute$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasBaseInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo$field);
         }
         if(this.hasAttribute)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.attribute$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.attributeEle.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.attributeEle[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.buffInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buffInfo[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new Dto_CardBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.attribute cannot be set twice.");
                  }
                  _loc4_++;
                  this.attribute = new Dto_CardAttribute();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attribute);
                  break;
               case 3:
                  this.attributeEle.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardAttributeEle()));
                  break;
               case 4:
                  this.buffInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardBuffInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
