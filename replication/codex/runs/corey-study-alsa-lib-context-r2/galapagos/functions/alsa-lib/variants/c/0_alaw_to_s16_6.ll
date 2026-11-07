; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_6.c"
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
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %code, align 4
  %mul = mul nsw i32 %3, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %t, align 4
  br label %if.end23

if.else:                                          ; preds = %entry
  %4 = load i32, ptr %code, align 4
  %cmp2 = icmp slt i32 %4, 32
  br i1 %cmp2, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  %5 = load i32, ptr %code, align 4
  %sub = sub nsw i32 %5, 16
  %mul5 = mul nsw i32 %sub, 16
  %add6 = add nsw i32 %mul5, 264
  store i32 %add6, ptr %t, align 4
  br label %if.end22

if.else7:                                         ; preds = %if.else
  %6 = load i32, ptr %code, align 4
  %cmp8 = icmp slt i32 %6, 64
  br i1 %cmp8, label %if.then10, label %if.else15

if.then10:                                        ; preds = %if.else7
  %7 = load i32, ptr %code, align 4
  %and11 = and i32 %7, 15
  %mul12 = mul nsw i32 %and11, 16
  %add13 = add nsw i32 %mul12, 264
  %8 = load i32, ptr %code, align 4
  %shr = ashr i32 %8, 4
  %sub14 = sub nsw i32 %shr, 1
  %shl = shl i32 %add13, %sub14
  store i32 %shl, ptr %t, align 4
  br label %if.end

if.else15:                                        ; preds = %if.else7
  %9 = load i32, ptr %code, align 4
  %and16 = and i32 %9, 15
  %mul17 = mul nsw i32 %and16, 16
  %add18 = add nsw i32 %mul17, 264
  %10 = load i32, ptr %code, align 4
  %shr19 = ashr i32 %10, 4
  %sub20 = sub nsw i32 %shr19, 1
  %shl21 = shl i32 %add18, %sub20
  store i32 %shl21, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.else15, %if.then10
  br label %if.end22

if.end22:                                         ; preds = %if.end, %if.then4
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then
  %11 = load i32, ptr %x, align 4
  %and24 = and i32 %11, 128
  %tobool = icmp ne i32 %and24, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end23
  %12 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end23
  %13 = load i32, ptr %t, align 4
  %sub25 = sub nsw i32 0, %13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %12, %cond.true ], [ %sub25, %cond.false ]
  ret i32 %cond
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
