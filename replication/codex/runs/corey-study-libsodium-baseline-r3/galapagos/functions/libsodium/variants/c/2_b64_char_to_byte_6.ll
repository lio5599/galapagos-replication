; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_char_to_byte.first = internal constant [3 x i32] [i32 65, i32 97, i32 48], align 4
@b64_char_to_byte.last = internal constant [3 x i32] [i32 90, i32 122, i32 57], align 4
@b64_char_to_byte.offset = internal constant [3 x i32] [i32 0, i32 26, i32 52], align 4

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
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  %value = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %u, align 4
  %2 = load i32, ptr %i, align 4
  %idxprom = zext i32 %2 to i64
  %arrayidx = getelementptr inbounds [3 x i32], ptr @b64_char_to_byte.first, i64 0, i64 %idxprom
  %3 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %1, %3
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %lo, align 4
  %4 = load i32, ptr %i, align 4
  %idxprom1 = zext i32 %4 to i64
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr @b64_char_to_byte.last, i64 0, i64 %idxprom1
  %5 = load i32, ptr %arrayidx2, align 4
  %6 = load i32, ptr %u, align 4
  %sub3 = sub i32 %5, %6
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %hi, align 4
  %7 = load i32, ptr %u, align 4
  %8 = load i32, ptr %i, align 4
  %idxprom5 = zext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr @b64_char_to_byte.first, i64 0, i64 %idxprom5
  %9 = load i32, ptr %arrayidx6, align 4
  %sub7 = sub i32 %7, %9
  %10 = load i32, ptr %i, align 4
  %idxprom8 = zext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [3 x i32], ptr @b64_char_to_byte.offset, i64 0, i64 %idxprom8
  %11 = load i32, ptr %arrayidx9, align 4
  %add = add i32 %sub7, %11
  store i32 %add, ptr %value, align 4
  %12 = load i32, ptr %value, align 4
  %13 = load i32, ptr %lo, align 4
  %14 = load i32, ptr %hi, align 4
  %or = or i32 %13, %14
  %and = and i32 %or, 255
  %xor = xor i32 255, %and
  %and10 = and i32 %12, %xor
  %15 = load i32, ptr %x, align 4
  %or11 = or i32 %15, %and10
  store i32 %or11, ptr %x, align 4
  %16 = load i32, ptr %i, align 4
  %inc = add i32 %16, 1
  store i32 %inc, ptr %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %17 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %17, 3
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  %18 = load i32, ptr %u, align 4
  %xor12 = xor i32 %18, 43
  %sub13 = sub i32 0, %xor12
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 255, %and15
  %and17 = and i32 %xor16, 62
  %19 = load i32, ptr %x, align 4
  %or18 = or i32 %19, %and17
  store i32 %or18, ptr %x, align 4
  %20 = load i32, ptr %u, align 4
  %xor19 = xor i32 %20, 47
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %xor23 = xor i32 255, %and22
  %and24 = and i32 %xor23, 63
  %21 = load i32, ptr %x, align 4
  %or25 = or i32 %21, %and24
  store i32 %or25, ptr %x, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %x, align 4
  %sub26 = sub i32 0, %23
  %shr27 = lshr i32 %sub26, 8
  %and28 = and i32 %shr27, 255
  %xor29 = xor i32 255, %and28
  %24 = load i32, ptr %u, align 4
  %xor30 = xor i32 %24, 65
  %sub31 = sub i32 0, %xor30
  %shr32 = lshr i32 %sub31, 8
  %and33 = and i32 %shr32, 255
  %and34 = and i32 %xor29, %and33
  %or35 = or i32 %22, %and34
  ret i32 %or35
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
