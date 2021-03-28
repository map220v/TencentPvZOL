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
   
   public final class Cmd_PuppetFuben_GetFormation_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PuppetFuben_GetFormation_SC";
      
      public static const FORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PuppetFuben_GetFormation_SC.formation","formation",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
       
      
      private var formation$field:Dto_FormationInfo;
      
      public function Cmd_PuppetFuben_GetFormation_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PuppetFuben_GetFormation_SC.$MessageID;
      }
      
      public function clearFormation() : void
      {
         this.formation$field = null;
      }
      
      public function get hasFormation() : Boolean
      {
         return this.formation$field != null;
      }
      
      public function set formation(param1:Dto_FormationInfo) : void
      {
         this.formation$field = param1;
      }
      
      public function get formation() : Dto_FormationInfo
      {
         return this.formation$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation$field);
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
                     throw new IOError("Bad data format: Cmd_PuppetFuben_GetFormation_SC.formation cannot be set twice.");
                  }
                  _loc3_++;
                  this.formation = new Dto_FormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.formation);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
