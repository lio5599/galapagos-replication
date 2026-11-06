; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %cmp = icmp ult i32 %0, 26
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %x.addr, align 4
  %add = add i32 65, %1
  store i32 %add, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %x.addr, align 4
  %cmp1 = icmp ult i32 %2, 52
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %3, 26
  %add3 = add i32 97, %sub
  store i32 %add3, ptr %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %4 = load i32, ptr %x.addr, align 4
  %cmp5 = icmp ult i32 %4, 62
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end4
  %5 = load i32, ptr %x.addr, align 4
  %sub7 = sub i32 %5, 52
  %add8 = add i32 48, %sub7
  store i32 %add8, ptr %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end4
  %6 = load i32, ptr %x.addr, align 4
  %cmp10 = icmp eq i32 %6, 62
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  store i32 43, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end9
  %7 = load i32, ptr %x.addr, align 4
  %cmp13 = icmp eq i32 %7, 63
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  store i32 47, ptr %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end12
  %8 = load i32, ptr %x.addr, align 4
  %sub16 = sub i32 %8, 26
  %shr = lshr i32 %sub16, 8
  %and = and i32 %shr, 255
  %9 = load i32, ptr %x.addr, align 4
  %add17 = add i32 %9, 65
  %and18 = and i32 %and, %add17
  %10 = load i32, ptr %x.addr, align 4
  %sub19 = sub i32 %10, 26
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  %xor = xor i32 %and21, 255
  %11 = load i32, ptr %x.addr, align 4
  %sub22 = sub i32 %11, 52
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %and25 = and i32 %xor, %and24
  %12 = load i32, ptr %x.addr, align 4
  %add26 = add i32 %12, 71
  %and27 = and i32 %and25, %add26
  %or = or i32 %and18, %and27
  %13 = load i32, ptr %x.addr, align 4
  %sub28 = sub i32 %13, 52
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 255
  %xor31 = xor i32 %and30, 255
  %14 = load i32, ptr %x.addr, align 4
  %sub32 = sub i32 %14, 62
  %shr33 = lshr i32 %sub32, 8
  %and34 = and i32 %shr33, 255
  %and35 = and i32 %xor31, %and34
  %15 = load i32, ptr %x.addr, align 4
  %sub36 = sub i32 %15, 4
  %and37 = and i32 %and35, %sub36
  %or38 = or i32 %or, %and37
  %16 = load i32, ptr %x.addr, align 4
  %xor39 = xor i32 %16, 62
  %sub40 = sub i32 0, %xor39
  %shr41 = lshr i32 %sub40, 8
  %and42 = and i32 %shr41, 255
  %xor43 = xor i32 %and42, 255
  %and44 = and i32 %xor43, 43
  %or45 = or i32 %or38, %and44
  %17 = load i32, ptr %x.addr, align 4
  %xor46 = xor i32 %17, 63
  %sub47 = sub i32 0, %xor46
  %shr48 = lshr i32 %sub47, 8
  %and49 = and i32 %shr48, 255
  %xor50 = xor i32 %and49, 255
  %and51 = and i32 %xor50, 47
  %or52 = or i32 %or45, %and51
  store i32 %or52, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then14, %if.then11, %if.then6, %if.then2, %if.then
  %18 = load i32, ptr %retval, align 4
  ret i32 %18
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
