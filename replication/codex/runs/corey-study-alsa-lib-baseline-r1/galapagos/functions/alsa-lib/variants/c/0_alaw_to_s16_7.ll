; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_7.c"
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
  %decoded = alloca i32, align 4
  %code = alloca i32, align 4
  %magnitude = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %decoded, align 4
  %1 = load i32, ptr %decoded, align 4
  %and = and i32 %1, 127
  store i32 %and, ptr %code, align 4
  %2 = load i32, ptr %code, align 4
  %cmp = icmp slt i32 %2, 16
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %code, align 4
  %mul = mul nsw i32 %3, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %magnitude, align 4
  br label %if.end50

if.else:                                          ; preds = %entry
  %4 = load i32, ptr %code, align 4
  %cmp2 = icmp slt i32 %4, 32
  br i1 %cmp2, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  %5 = load i32, ptr %code, align 4
  %mul5 = mul nsw i32 %5, 16
  %add6 = add nsw i32 %mul5, 8
  store i32 %add6, ptr %magnitude, align 4
  br label %if.end49

if.else7:                                         ; preds = %if.else
  %6 = load i32, ptr %code, align 4
  %cmp8 = icmp slt i32 %6, 48
  br i1 %cmp8, label %if.then10, label %if.else13

if.then10:                                        ; preds = %if.else7
  %7 = load i32, ptr %code, align 4
  %sub = sub nsw i32 %7, 32
  %mul11 = mul nsw i32 %sub, 32
  %add12 = add nsw i32 %mul11, 528
  store i32 %add12, ptr %magnitude, align 4
  br label %if.end48

if.else13:                                        ; preds = %if.else7
  %8 = load i32, ptr %code, align 4
  %cmp14 = icmp slt i32 %8, 64
  br i1 %cmp14, label %if.then16, label %if.else20

if.then16:                                        ; preds = %if.else13
  %9 = load i32, ptr %code, align 4
  %sub17 = sub nsw i32 %9, 48
  %mul18 = mul nsw i32 %sub17, 64
  %add19 = add nsw i32 %mul18, 1056
  store i32 %add19, ptr %magnitude, align 4
  br label %if.end47

if.else20:                                        ; preds = %if.else13
  %10 = load i32, ptr %code, align 4
  %cmp21 = icmp slt i32 %10, 80
  br i1 %cmp21, label %if.then23, label %if.else27

if.then23:                                        ; preds = %if.else20
  %11 = load i32, ptr %code, align 4
  %sub24 = sub nsw i32 %11, 64
  %mul25 = mul nsw i32 %sub24, 128
  %add26 = add nsw i32 %mul25, 2112
  store i32 %add26, ptr %magnitude, align 4
  br label %if.end46

if.else27:                                        ; preds = %if.else20
  %12 = load i32, ptr %code, align 4
  %cmp28 = icmp slt i32 %12, 96
  br i1 %cmp28, label %if.then30, label %if.else34

if.then30:                                        ; preds = %if.else27
  %13 = load i32, ptr %code, align 4
  %sub31 = sub nsw i32 %13, 80
  %mul32 = mul nsw i32 %sub31, 256
  %add33 = add nsw i32 %mul32, 4224
  store i32 %add33, ptr %magnitude, align 4
  br label %if.end45

if.else34:                                        ; preds = %if.else27
  %14 = load i32, ptr %code, align 4
  %cmp35 = icmp slt i32 %14, 112
  br i1 %cmp35, label %if.then37, label %if.else41

if.then37:                                        ; preds = %if.else34
  %15 = load i32, ptr %code, align 4
  %sub38 = sub nsw i32 %15, 96
  %mul39 = mul nsw i32 %sub38, 512
  %add40 = add nsw i32 %mul39, 8448
  store i32 %add40, ptr %magnitude, align 4
  br label %if.end

if.else41:                                        ; preds = %if.else34
  %16 = load i32, ptr %code, align 4
  %sub42 = sub nsw i32 %16, 112
  %mul43 = mul nsw i32 %sub42, 1024
  %add44 = add nsw i32 %mul43, 16896
  store i32 %add44, ptr %magnitude, align 4
  br label %if.end

if.end:                                           ; preds = %if.else41, %if.then37
  br label %if.end45

if.end45:                                         ; preds = %if.end, %if.then30
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then23
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then16
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then10
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then4
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then
  %17 = load i32, ptr %decoded, align 4
  %and51 = and i32 %17, 128
  %tobool = icmp ne i32 %and51, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end50
  %18 = load i32, ptr %magnitude, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end50
  %19 = load i32, ptr %magnitude, align 4
  %sub52 = sub nsw i32 0, %19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %sub52, %cond.false ]
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
