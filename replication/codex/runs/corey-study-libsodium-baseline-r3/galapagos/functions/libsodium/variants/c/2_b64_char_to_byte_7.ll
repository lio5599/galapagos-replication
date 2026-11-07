; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
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
  %value = alloca i32, align 4
  %reject = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %1, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4
  switch i32 %2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb8
    i32 3, label %sw.bb13
  ]

sw.bb:                                            ; preds = %for.body
  %3 = load i32, ptr %u, align 4
  %sub = sub i32 %3, 65
  store i32 %sub, ptr %value, align 4
  %4 = load i32, ptr %u, align 4
  %sub1 = sub i32 %4, 65
  %5 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %5
  %or = or i32 %sub1, %sub2
  store i32 %or, ptr %reject, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %for.body
  %6 = load i32, ptr %u, align 4
  %sub4 = sub i32 %6, 71
  store i32 %sub4, ptr %value, align 4
  %7 = load i32, ptr %u, align 4
  %sub5 = sub i32 %7, 97
  %8 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %8
  %or7 = or i32 %sub5, %sub6
  store i32 %or7, ptr %reject, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %for.body
  %9 = load i32, ptr %u, align 4
  %sub9 = sub i32 %9, -4
  store i32 %sub9, ptr %value, align 4
  %10 = load i32, ptr %u, align 4
  %sub10 = sub i32 %10, 48
  %11 = load i32, ptr %u, align 4
  %sub11 = sub i32 57, %11
  %or12 = or i32 %sub10, %sub11
  store i32 %or12, ptr %reject, align 4
  br label %sw.epilog

sw.bb13:                                          ; preds = %for.body
  store i32 62, ptr %value, align 4
  %12 = load i32, ptr %u, align 4
  %xor = xor i32 %12, 43
  %sub14 = sub i32 0, %xor
  store i32 %sub14, ptr %reject, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %for.body
  store i32 63, ptr %value, align 4
  %13 = load i32, ptr %u, align 4
  %xor15 = xor i32 %13, 47
  %sub16 = sub i32 0, %xor15
  store i32 %sub16, ptr %reject, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb13, %sw.bb8, %sw.bb3, %sw.bb
  %14 = load i32, ptr %value, align 4
  %15 = load i32, ptr %reject, align 4
  %shr = lshr i32 %15, 8
  %not = xor i32 %shr, -1
  %and = and i32 %14, %not
  %and17 = and i32 %and, 255
  %16 = load i32, ptr %x, align 4
  %or18 = or i32 %16, %and17
  store i32 %or18, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog
  %17 = load i32, ptr %i, align 4
  %inc = add i32 %17, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %18 = load i32, ptr %x, align 4
  %cmp19 = icmp eq i32 %18, 0
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %19 = load i32, ptr %u, align 4
  %xor20 = xor i32 %19, 65
  %sub21 = sub i32 0, %xor20
  %shr22 = lshr i32 %sub21, 8
  %and23 = and i32 %shr22, 255
  store i32 %and23, ptr %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %20 = load i32, ptr %x, align 4
  ret i32 %20
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
