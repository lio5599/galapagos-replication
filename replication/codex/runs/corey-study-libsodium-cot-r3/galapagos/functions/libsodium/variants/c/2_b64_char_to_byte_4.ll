; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %ma = alloca i32, align 4
  %mb = alloca i32, align 4
  %md = alloca i32, align 4
  %mp = alloca i32, align 4
  %ms = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %div = udiv i32 %or, 256
  %rem = urem i32 %div, 256
  %sub2 = sub i32 255, %rem
  store i32 %sub2, ptr %ma, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %4
  %or5 = or i32 %sub3, %sub4
  %div6 = udiv i32 %or5, 256
  %rem7 = urem i32 %div6, 256
  %sub8 = sub i32 255, %rem7
  store i32 %sub8, ptr %mb, align 4
  %5 = load i32, ptr %u, align 4
  %sub9 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 57, %6
  %or11 = or i32 %sub9, %sub10
  %div12 = udiv i32 %or11, 256
  %rem13 = urem i32 %div12, 256
  %sub14 = sub i32 255, %rem13
  store i32 %sub14, ptr %md, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub15 = sub i32 0, %xor
  %div16 = udiv i32 %sub15, 256
  %rem17 = urem i32 %div16, 256
  %sub18 = sub i32 255, %rem17
  store i32 %sub18, ptr %mp, align 4
  %8 = load i32, ptr %u, align 4
  %xor19 = xor i32 %8, 47
  %sub20 = sub i32 0, %xor19
  %div21 = udiv i32 %sub20, 256
  %rem22 = urem i32 %div21, 256
  %sub23 = sub i32 255, %rem22
  store i32 %sub23, ptr %ms, align 4
  %9 = load i32, ptr %ma, align 4
  %10 = load i32, ptr %u, align 4
  %sub24 = sub i32 %10, 65
  %and = and i32 %9, %sub24
  %11 = load i32, ptr %mb, align 4
  %12 = load i32, ptr %u, align 4
  %sub25 = sub i32 %12, 71
  %and26 = and i32 %11, %sub25
  %or27 = or i32 %and, %and26
  %13 = load i32, ptr %md, align 4
  %14 = load i32, ptr %u, align 4
  %sub28 = sub i32 %14, -4
  %and29 = and i32 %13, %sub28
  %or30 = or i32 %or27, %and29
  %15 = load i32, ptr %mp, align 4
  %and31 = and i32 %15, 62
  %or32 = or i32 %or30, %and31
  %16 = load i32, ptr %ms, align 4
  %and33 = and i32 %16, 63
  %or34 = or i32 %or32, %and33
  store i32 %or34, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %17, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %18 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %19 = load i32, ptr %u, align 4
  %xor35 = xor i32 %19, 65
  %sub36 = sub i32 0, %xor35
  %div37 = udiv i32 %sub36, 256
  %rem38 = urem i32 %div37, 256
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %rem38, %cond.false ]
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
