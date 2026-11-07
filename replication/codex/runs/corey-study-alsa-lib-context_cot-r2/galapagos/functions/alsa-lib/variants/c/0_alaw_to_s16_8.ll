; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %retval = alloca i32, align 4
  %a_val.addr = alloca i8, align 1
  %x = alloca i32, align 4
  %code = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %and = and i32 %1, 127
  store i32 %and, ptr %code, align 4
  %2 = load i32, ptr %code, align 4
  %cmp = icmp slt i32 %2, 16
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %code, align 4
  %mul = mul nsw i32 %3, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %t, align 4
  %4 = load i32, ptr %x, align 4
  %and2 = and i32 %4, 128
  %tobool = icmp ne i32 %and2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %5 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %6 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %7 = load i32, ptr %code, align 4
  %and3 = and i32 %7, 15
  %or = or i32 %and3, 16
  %mul4 = mul nsw i32 %or, 16
  %add5 = add nsw i32 %mul4, 8
  %8 = load i32, ptr %code, align 4
  %shr = ashr i32 %8, 4
  %sub6 = sub nsw i32 %shr, 1
  %shl = shl i32 %add5, %sub6
  store i32 %shl, ptr %t, align 4
  %9 = load i32, ptr %x, align 4
  %and7 = and i32 %9, 128
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %if.end
  %10 = load i32, ptr %t, align 4
  br label %cond.end12

cond.false10:                                     ; preds = %if.end
  %11 = load i32, ptr %t, align 4
  %sub11 = sub nsw i32 0, %11
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false10, %cond.true9
  %cond13 = phi i32 [ %10, %cond.true9 ], [ %sub11, %cond.false10 ]
  store i32 %cond13, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end12, %cond.end
  %12 = load i32, ptr %retval, align 4
  ret i32 %12
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
