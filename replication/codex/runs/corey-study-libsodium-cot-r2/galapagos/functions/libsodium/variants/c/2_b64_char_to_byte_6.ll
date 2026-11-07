; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
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
  %first = alloca i32, align 4
  %last = alloca i32, align 4
  %base = alloca i32, align 4
  %symbol = alloca i32, align 4
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
  store i32 0, ptr %first, align 4
  store i32 0, ptr %last, align 4
  store i32 0, ptr %base, align 4
  store i32 0, ptr %symbol, align 4
  %2 = load i32, ptr %i, align 4
  switch i32 %2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
  ]

sw.bb:                                            ; preds = %for.body
  store i32 65, ptr %first, align 4
  store i32 90, ptr %last, align 4
  store i32 0, ptr %base, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %for.body
  store i32 97, ptr %first, align 4
  store i32 122, ptr %last, align 4
  store i32 26, ptr %base, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %for.body
  store i32 48, ptr %first, align 4
  store i32 57, ptr %last, align 4
  store i32 52, ptr %base, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %for.body
  store i32 43, ptr %symbol, align 4
  store i32 62, ptr %base, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %for.body
  store i32 47, ptr %symbol, align 4
  store i32 63, ptr %base, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %3 = load i32, ptr %i, align 4
  %cmp4 = icmp ult i32 %3, 3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %sw.epilog
  %4 = load i32, ptr %u, align 4
  %5 = load i32, ptr %first, align 4
  %sub = sub i32 %4, %5
  %6 = load i32, ptr %last, align 4
  %7 = load i32, ptr %u, align 4
  %sub5 = sub i32 %6, %7
  %or = or i32 %sub, %sub5
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %8 = load i32, ptr %u, align 4
  %9 = load i32, ptr %first, align 4
  %sub6 = sub i32 %8, %9
  %10 = load i32, ptr %base, align 4
  %add = add i32 %sub6, %10
  %and7 = and i32 %and, %add
  %11 = load i32, ptr %x, align 4
  %or8 = or i32 %11, %and7
  store i32 %or8, ptr %x, align 4
  br label %if.end

if.else:                                          ; preds = %sw.epilog
  %12 = load i32, ptr %u, align 4
  %13 = load i32, ptr %symbol, align 4
  %xor = xor i32 %12, %13
  %sub9 = sub i32 0, %xor
  %not10 = xor i32 %sub9, -1
  %shr11 = lshr i32 %not10, 8
  %and12 = and i32 %shr11, 255
  %14 = load i32, ptr %base, align 4
  %and13 = and i32 %and12, %14
  %15 = load i32, ptr %x, align 4
  %or14 = or i32 %15, %and13
  store i32 %or14, ptr %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %16 = load i32, ptr %i, align 4
  %inc = add i32 %16, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %17 = load i32, ptr %x, align 4
  %cmp15 = icmp ne i32 %17, 0
  br i1 %cmp15, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %18 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %19 = load i32, ptr %u, align 4
  %xor16 = xor i32 %19, 65
  %sub17 = sub i32 0, %xor16
  %shr18 = lshr i32 %sub17, 8
  %and19 = and i32 %shr18, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %and19, %cond.false ]
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
