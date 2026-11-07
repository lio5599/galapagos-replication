; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and3 = and i32 %and, %sub2
  store i32 %and3, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %5
  %or6 = or i32 %sub4, %sub5
  %not7 = xor i32 %or6, -1
  %shr8 = lshr i32 %not7, 8
  %and9 = and i32 %shr8, 255
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 97
  %add = add i32 %sub10, 26
  %and11 = and i32 %and9, %add
  store i32 %and11, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub12 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %8
  %or14 = or i32 %sub12, %sub13
  %not15 = xor i32 %or14, -1
  %shr16 = lshr i32 %not15, 8
  %and17 = and i32 %shr16, 255
  %9 = load i32, ptr %u, align 4
  %sub18 = sub i32 %9, 48
  %add19 = add i32 %sub18, 52
  %and20 = and i32 %and17, %add19
  store i32 %and20, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub21 = sub i32 0, %xor
  %not22 = xor i32 %sub21, -1
  %shr23 = lshr i32 %not22, 8
  %and24 = and i32 %shr23, 255
  %and25 = and i32 %and24, 62
  store i32 %and25, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor26 = xor i32 %11, 47
  %sub27 = sub i32 0, %xor26
  %not28 = xor i32 %sub27, -1
  %shr29 = lshr i32 %not28, 8
  %and30 = and i32 %shr29, 255
  %and31 = and i32 %and30, 63
  store i32 %and31, ptr %q, align 4
  %12 = load i32, ptr %a, align 4
  %not32 = xor i32 %12, -1
  %13 = load i32, ptr %b, align 4
  %not33 = xor i32 %13, -1
  %and34 = and i32 %not32, %not33
  %14 = load i32, ptr %d, align 4
  %not35 = xor i32 %14, -1
  %and36 = and i32 %and34, %not35
  %15 = load i32, ptr %p, align 4
  %not37 = xor i32 %15, -1
  %and38 = and i32 %and36, %not37
  %16 = load i32, ptr %q, align 4
  %not39 = xor i32 %16, -1
  %and40 = and i32 %and38, %not39
  %not41 = xor i32 %and40, -1
  store i32 %not41, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %cmp = icmp eq i32 %17, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %18 = load i32, ptr %u, align 4
  %xor42 = xor i32 %18, 65
  %sub43 = sub i32 0, %xor42
  %shr44 = lshr i32 %sub43, 8
  %and45 = and i32 %shr44, 255
  store i32 %and45, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %19 = load i32, ptr %x, align 4
  store i32 %19, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %20 = load i32, ptr %retval, align 4
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
