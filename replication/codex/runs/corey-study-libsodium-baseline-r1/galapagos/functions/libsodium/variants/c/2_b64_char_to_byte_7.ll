; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
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
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %rejected = alloca i32, align 4
  %value = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4
  switch i32 %1, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb9
    i32 3, label %sw.bb16
  ]

sw.bb:                                            ; preds = %do.body
  %2 = load i32, ptr %u, align 4
  %sub = sub i32 %2, 65
  %3 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %3
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  store i32 %shr, ptr %rejected, align 4
  %4 = load i32, ptr %u, align 4
  %sub2 = sub i32 %4, 65
  store i32 %sub2, ptr %value, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %do.body
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %6
  %or6 = or i32 %sub4, %sub5
  %shr7 = lshr i32 %or6, 8
  store i32 %shr7, ptr %rejected, align 4
  %7 = load i32, ptr %u, align 4
  %sub8 = sub i32 %7, 97
  %add = add i32 %sub8, 26
  store i32 %add, ptr %value, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %do.body
  %8 = load i32, ptr %u, align 4
  %sub10 = sub i32 %8, 48
  %9 = load i32, ptr %u, align 4
  %sub11 = sub i32 57, %9
  %or12 = or i32 %sub10, %sub11
  %shr13 = lshr i32 %or12, 8
  store i32 %shr13, ptr %rejected, align 4
  %10 = load i32, ptr %u, align 4
  %sub14 = sub i32 %10, 48
  %add15 = add i32 %sub14, 52
  store i32 %add15, ptr %value, align 4
  br label %sw.epilog

sw.bb16:                                          ; preds = %do.body
  %11 = load i32, ptr %u, align 4
  %xor = xor i32 %11, 43
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  store i32 %shr18, ptr %rejected, align 4
  store i32 62, ptr %value, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %do.body
  %12 = load i32, ptr %u, align 4
  %xor19 = xor i32 %12, 47
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  store i32 %shr21, ptr %rejected, align 4
  store i32 63, ptr %value, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb16, %sw.bb9, %sw.bb3, %sw.bb
  %13 = load i32, ptr %value, align 4
  %14 = load i32, ptr %rejected, align 4
  %not = xor i32 %14, -1
  %and = and i32 %13, %not
  %and22 = and i32 %and, 255
  %15 = load i32, ptr %x, align 4
  %or23 = or i32 %15, %and22
  store i32 %or23, ptr %x, align 4
  br label %do.cond

do.cond:                                          ; preds = %sw.epilog
  %16 = load i32, ptr %i, align 4
  %inc = add i32 %16, 1
  store i32 %inc, ptr %i, align 4
  %cmp = icmp ult i32 %inc, 5
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  %17 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %17, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end
  %18 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %do.end
  %19 = load i32, ptr %u, align 4
  %xor24 = xor i32 %19, 65
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %and27, %cond.false ]
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
