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
   
   public final class Cmd_NoEndFuben_Info_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndFuben_Info_CS";
      
      public static const NOENDFUBEN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Info_CS.noEndFuben","noEndFuben",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Rank_NoEndFuben);
       
      
      private var noEndFuben$field:Dto_Rank_NoEndFuben;
      
      public function Cmd_NoEndFuben_Info_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndFuben_Info_CS.$MessageID;
      }
      
      public function clearNoEndFuben() : void
      {
         this.noEndFuben$field = null;
      }
      
      public function get hasNoEndFuben() : Boolean
      {
         return this.noEndFuben$field != null;
      }
      
      public function set noEndFuben(param1:Dto_Rank_NoEndFuben) : void
      {
         this.noEndFuben$field = param1;
      }
      
      public function get noEndFuben() : Dto_Rank_NoEndFuben
      {
         return this.noEndFuben$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasNoEndFuben)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.noEndFuben$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_CS.noEndFuben cannot be set twice.");
                  }
                  _loc3_++;
                  this.noEndFuben = new Dto_Rank_NoEndFuben();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.noEndFuben);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
